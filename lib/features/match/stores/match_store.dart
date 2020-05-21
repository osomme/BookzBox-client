import 'dart:async';

import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/features/match/match.dart';
import 'package:mobx/mobx.dart';

part 'match_store.g.dart';

/// Store which contains reactive properties and methods for interacting with a match.
class MatchStore = _MatchStore with _$MatchStore;

abstract class _MatchStore with Store {
  final IMatchRepository _repository;

  final ActivityFeedStore _feedStore;

  StreamSubscription<Match> _matchSubscription;

  StreamSubscription<List<TradeOffer>> _tradeSubscription;

  ReactionDisposer _unreadNotificationsDisposer;

  String _clientUserId;

  @observable
  String _matchId;

  @observable
  List<TradeOffer> _offers = List();

  @observable
  Match _match;

  @observable
  bool _isPostingOffer = false;

  @observable
  bool _isReplyingToOffer = false;

  @observable
  int _numUnreadTradeRequests = 0;

  _MatchStore(this._repository, this._feedStore);

  /// The ID of the other user in the match, or null if match has not been loaded.
  @computed
  String get otherUserId =>
      _match?.participants?.firstWhere((id) => id != _clientUserId, orElse: () => null);

  /// The most recent trade offer of the other user in the match, or null if match has not been loaded or no offer has been made.
  @computed
  TradeOffer get otherUserOffer =>
      _offers.firstWhere((o) => o.offerByUserId != _clientUserId, orElse: () => null);

  /// The most recent trade offer of the client user in the match, or null if match has not been loaded or no offer has been made.
  @computed
  TradeOffer get clientUserOffer =>
      _offers.firstWhere((o) => o.offerByUserId == _clientUserId, orElse: () => null);

  /// Returns a list of trade offers. Empty list of no offers have been made, or until match has been loaded.
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

  /// The number of unread trade requests.
  @computed
  int get numUnreadTradeRequests => _numUnreadTradeRequests;

  /// Whether there are any unread trade requests.
  @computed
  bool get hasUnreadTradeRequests => _numUnreadTradeRequests != 0;

  /// Initializes the store by loading match and trade offer streams.
  ///
  /// [matchId] The ID of the match that is being loaded.
  /// [clientUserId] The ID of the user that is currently logged in.
  @action
  void init(String matchId, String clientUserId) {
    _matchId = matchId;
    _clientUserId = clientUserId;

    _setUnreadNotificationsListener(matchId);

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

  /// Posts a new trade offer.
  ///
  /// [offer] The offer that is being made.
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

  /// Accepts a trade offer.
  ///
  /// [offer] The offer that is being accepted.
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

  /// Rejects a trade offer.
  ///
  /// [offer] The offer that is being rejected.
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

  /// Marks all trade notifications as read.
  ///
  /// [matchId] The ID of the match that the trade offers belong to.
  void markTradeNotificationsAsRead(String matchId) {
    _feedStore.activityNotifications
        .where((a) =>
            a.type is TradeActivity &&
            !a.read &&
            (a.type as TradeActivity).matchId == _matchId)
        .forEach((a) => _feedStore.markAsRead(_clientUserId, a.id));
  }

  /// Cleans up resources used by the store. Should always be called before an instance of this class is garbage collected.
  void dispose() {
    _unreadNotificationsDisposer?.call();
    _matchSubscription?.cancel();
    _tradeSubscription?.cancel();
  }

  void _setUnreadNotificationsListener(String matchId) {
    _unreadNotificationsDisposer = autorun((_) {
      _numUnreadTradeRequests = _feedStore.activityNotifications
          .where((a) =>
              a.type is TradeActivity &&
              !a.read &&
              (a.type as TradeActivity).matchId == _matchId)
          .length;
    });
  }
}
