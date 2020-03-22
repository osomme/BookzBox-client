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
  bool _matchIsActive = false;

  @observable
  List<TradeOffer> _offers = List();

  _MatchStore(this._repository);

  @computed
  Option<TradeOffer> get lastOffer => _offers.isNotEmpty ? some(_offers.last) : none();

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
  bool get anyOffersExist => _offers.isNotEmpty && matchIsActive;

  /// [true] if the match is currently active, [false] otherwise.
  @computed
  bool get matchIsActive => _matchIsActive;

  @action
  void init(String matchId, String clientUserId) {
    _matchId = matchId;
    _clientUserId = clientUserId;
    // Match stream
    _repository.getMatchStream(matchId).then((stream) =>
        _matchSubscription = stream.listen((match) => _matchIsActive = match.active));
    // Trade offers stream
    _repository.getTradeOfferStream(matchId).then(
        (stream) => _tradeSubscription = stream.listen((offers) => _offers = offers));
  }

  void dispose() {
    _matchSubscription?.cancel();
    _tradeSubscription?.cancel();
  }
}
