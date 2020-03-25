import 'dart:async';

import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/features/match/match.dart';
import 'package:mobx/mobx.dart';

part 'match_store.g.dart';

class MatchStore = _MatchStore with _$MatchStore;

abstract class _MatchStore with Store {
  final IMatchRepository _repository;

  final ActivityFeedStore _feedStore;

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

  @observable
  bool _isReplyingToOffer = false;

  _MatchStore(this._repository, this._feedStore);

  @computed
  String get otherUserId =>
      _match?.participants?.firstWhere((id) => id != _clientUserId, orElse: () => null);

  @computed
  TradeOffer get otherUserOffer =>
      _offers.lastWhere((o) => o.offerByUserId != _clientUserId, orElse: () => null);

  @computed
  TradeOffer get clientUserOffer =>
      _offers.lastWhere((o) => o.offerByUserId == _clientUserId, orElse: () => null);

  @computed
  List<TradeOffer> get offers => _offers;

  /// [true] if nobody has made any offers yet, [false] otherwise.
  @computed
  bool get anyOffersExist => _offers.isNotEmpty && matchIsActive;

  /// [true] if the match is currently active, [false] otherwise.
  @computed
  bool get matchIsActive => _match != null && _match.active;

  /// [true] if a offer is currently being posted to the database, [false] otherwise.
  @computed
  bool get isPostingOffer => _isPostingOffer;

  /// [true] if an offer is currently being replied to, [false] otherwise.
  @computed
  bool get isReplyingToOffer => _isReplyingToOffer;

  @computed
  int get numUnreadTradeRequests => _feedStore.activityNotifications
      .where((a) =>
          a is TradeActivtiy && !a.read && (a.type as TradeActivtiy).matchId == _matchId)
      .length;

  @computed
  bool get hasUnreadTradeRequests => numUnreadTradeRequests != 0;

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
      (error) => print('[MATCH STORE] Error while posting trade offer: $error'),
      (success) => print('[MATCH STORE] Posted trade offer'),
    );
    _isPostingOffer = false;
  }

  @action
  Future<void> acceptOffer(TradeOffer offer) async {
    _isReplyingToOffer = true;
    final result = await _repository.acceptTradeOffer(_matchId, offer);
    result.fold(
      (error) =>
          print('[MATCH STORE] Error while attempting to accept trade offer: $offer'),
      (success) => print('[MATCH STORE] Successfully accepted trade offer: $offer'),
    );
    _isReplyingToOffer = false;
  }

  @action
  Future<void> rejectOffer(TradeOffer offer) async {
    _isReplyingToOffer = true;
    final result = await _repository.rejectTradeOffer(_matchId, offer);
    result.fold(
      (error) =>
          print('[MATCH STORE] Error while attempting to reject trade offer: $offer'),
      (success) => print('[MATCH STORE] Successfully rejeced trade offer: $offer'),
    );
    _isReplyingToOffer = false;
  }

  void dispose() {
    _matchSubscription?.cancel();
    _tradeSubscription?.cancel();
  }
}
