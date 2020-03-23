import 'dart:async';

import 'package:bookzbox/features/match/match.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

part 'match_store.g.dart';

class MatchStore = _MatchStore with _$MatchStore;

abstract class _MatchStore with Store {
  final IMatchRepository _repository;

  StreamSubscription<Match> _matchSubscription;

  StreamSubscription<List<TradeOffer>> _tradeSubscription;

  String _matchId;

  String _clientUserId;

  @observable
  List<TradeOffer> _offers = List();

  @observable
  Match _match;

  @observable
  bool _isPostingOffer = false;

  _MatchStore(this._repository);

  @computed
  String get otherUserId =>
      _match?.participants?.firstWhere((id) => id != _clientUserId, orElse: () => null);

  @computed
  Option<TradeOffer> get lastOffer => _offers.isNotEmpty ? some(_offers.last) : none();

  @computed
  List<TradeOffer> get offers => _offers;

  /// [true] if the client user has an pending offer that the other user has not responded to yet, [false] otherwise.
  @computed
  bool get clientUserHasPendingOffer => lastOffer
      .map(
          (o) => o.status == TradeOfferStatus.Waiting && o.offerByUserId == _clientUserId)
      .getOrElse(() => false);

  /// [true] if the other user has a offer that the client user has not responded to yet, [false] otherwise.
  @computed
  bool get doesOtherUserHaveOffer => lastOffer.isSome() && !clientUserHasPendingOffer;

  /// [true] if nobody has made any offers yet, [false] otherwise.
  @computed
  bool get anyOffersExist => lastOffer.isSome() && matchIsActive;

  /// [true] if the match is currently active, [false] otherwise.
  @computed
  bool get matchIsActive => _match != null && _match.active;

  /// [true] if a offer is currently being posted to the database, [false] otherwise.
  @computed
  bool get isPostingOffer => _isPostingOffer;

  @action
  void init(String matchId, String clientUserId) {
    _matchId = matchId;
    _clientUserId = clientUserId;
    // Match stream
    _repository
        .getMatchStream(matchId)
        .then((stream) => _matchSubscription = stream.listen((match) {
              print('Match stream updated: $match');
              _match = match;
            }));
    // Trade offers stream
    _repository
        .getTradeOfferStream(matchId)
        .then((stream) => _tradeSubscription = stream.listen((offers) {
              print('Trade offers stream updated: ${offers.length}');
              _offers = offers;
            }));
  }

  @action
  Future<void> postOffer(TradeOffer offer) async {
    _isPostingOffer = true;
    final result = await _repository.postTradeOffer(_matchId, offer);
    result.fold(
      (error) => print('Error while posting trade offer: $error'),
      (success) => print('Posted trade offer'),
    );
    _isPostingOffer = false;
  }

  void dispose() {
    _matchSubscription?.cancel();
    _tradeSubscription?.cancel();
  }
}
