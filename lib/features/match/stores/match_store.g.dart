// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MatchStore on _MatchStore, Store {
  Computed<String> _$otherUserIdComputed;

  @override
  String get otherUserId =>
      (_$otherUserIdComputed ??= Computed<String>(() => super.otherUserId))
          .value;
  Computed<TradeOffer> _$otherUserOfferComputed;

  @override
  TradeOffer get otherUserOffer => (_$otherUserOfferComputed ??=
          Computed<TradeOffer>(() => super.otherUserOffer))
      .value;
  Computed<TradeOffer> _$clientUserOfferComputed;

  @override
  TradeOffer get clientUserOffer => (_$clientUserOfferComputed ??=
          Computed<TradeOffer>(() => super.clientUserOffer))
      .value;
  Computed<List<TradeOffer>> _$offersComputed;

  @override
  List<TradeOffer> get offers =>
      (_$offersComputed ??= Computed<List<TradeOffer>>(() => super.offers))
          .value;
  Computed<bool> _$anyOffersExistComputed;

  @override
  bool get anyOffersExist =>
      (_$anyOffersExistComputed ??= Computed<bool>(() => super.anyOffersExist))
          .value;
  Computed<bool> _$matchIsActiveComputed;

  @override
  bool get matchIsActive =>
      (_$matchIsActiveComputed ??= Computed<bool>(() => super.matchIsActive))
          .value;
  Computed<bool> _$isPostingOfferComputed;

  @override
  bool get isPostingOffer =>
      (_$isPostingOfferComputed ??= Computed<bool>(() => super.isPostingOffer))
          .value;
  Computed<bool> _$isReplyingToOfferComputed;

  @override
  bool get isReplyingToOffer => (_$isReplyingToOfferComputed ??=
          Computed<bool>(() => super.isReplyingToOffer))
      .value;
  Computed<int> _$numUnreadTradeRequestsComputed;

  @override
  int get numUnreadTradeRequests => (_$numUnreadTradeRequestsComputed ??=
          Computed<int>(() => super.numUnreadTradeRequests))
      .value;
  Computed<bool> _$hasUnreadTradeRequestsComputed;

  @override
  bool get hasUnreadTradeRequests => (_$hasUnreadTradeRequestsComputed ??=
          Computed<bool>(() => super.hasUnreadTradeRequests))
      .value;

  final _$_matchIdAtom = Atom(name: '_MatchStore._matchId');

  @override
  String get _matchId {
    _$_matchIdAtom.context.enforceReadPolicy(_$_matchIdAtom);
    _$_matchIdAtom.reportObserved();
    return super._matchId;
  }

  @override
  set _matchId(String value) {
    _$_matchIdAtom.context.conditionallyRunInAction(() {
      super._matchId = value;
      _$_matchIdAtom.reportChanged();
    }, _$_matchIdAtom, name: '${_$_matchIdAtom.name}_set');
  }

  final _$_offersAtom = Atom(name: '_MatchStore._offers');

  @override
  List<TradeOffer> get _offers {
    _$_offersAtom.context.enforceReadPolicy(_$_offersAtom);
    _$_offersAtom.reportObserved();
    return super._offers;
  }

  @override
  set _offers(List<TradeOffer> value) {
    _$_offersAtom.context.conditionallyRunInAction(() {
      super._offers = value;
      _$_offersAtom.reportChanged();
    }, _$_offersAtom, name: '${_$_offersAtom.name}_set');
  }

  final _$_matchAtom = Atom(name: '_MatchStore._match');

  @override
  Match get _match {
    _$_matchAtom.context.enforceReadPolicy(_$_matchAtom);
    _$_matchAtom.reportObserved();
    return super._match;
  }

  @override
  set _match(Match value) {
    _$_matchAtom.context.conditionallyRunInAction(() {
      super._match = value;
      _$_matchAtom.reportChanged();
    }, _$_matchAtom, name: '${_$_matchAtom.name}_set');
  }

  final _$_isPostingOfferAtom = Atom(name: '_MatchStore._isPostingOffer');

  @override
  bool get _isPostingOffer {
    _$_isPostingOfferAtom.context.enforceReadPolicy(_$_isPostingOfferAtom);
    _$_isPostingOfferAtom.reportObserved();
    return super._isPostingOffer;
  }

  @override
  set _isPostingOffer(bool value) {
    _$_isPostingOfferAtom.context.conditionallyRunInAction(() {
      super._isPostingOffer = value;
      _$_isPostingOfferAtom.reportChanged();
    }, _$_isPostingOfferAtom, name: '${_$_isPostingOfferAtom.name}_set');
  }

  final _$_isReplyingToOfferAtom = Atom(name: '_MatchStore._isReplyingToOffer');

  @override
  bool get _isReplyingToOffer {
    _$_isReplyingToOfferAtom.context
        .enforceReadPolicy(_$_isReplyingToOfferAtom);
    _$_isReplyingToOfferAtom.reportObserved();
    return super._isReplyingToOffer;
  }

  @override
  set _isReplyingToOffer(bool value) {
    _$_isReplyingToOfferAtom.context.conditionallyRunInAction(() {
      super._isReplyingToOffer = value;
      _$_isReplyingToOfferAtom.reportChanged();
    }, _$_isReplyingToOfferAtom, name: '${_$_isReplyingToOfferAtom.name}_set');
  }

  final _$_numUnreadTradeRequestsAtom =
      Atom(name: '_MatchStore._numUnreadTradeRequests');

  @override
  int get _numUnreadTradeRequests {
    _$_numUnreadTradeRequestsAtom.context
        .enforceReadPolicy(_$_numUnreadTradeRequestsAtom);
    _$_numUnreadTradeRequestsAtom.reportObserved();
    return super._numUnreadTradeRequests;
  }

  @override
  set _numUnreadTradeRequests(int value) {
    _$_numUnreadTradeRequestsAtom.context.conditionallyRunInAction(() {
      super._numUnreadTradeRequests = value;
      _$_numUnreadTradeRequestsAtom.reportChanged();
    }, _$_numUnreadTradeRequestsAtom,
        name: '${_$_numUnreadTradeRequestsAtom.name}_set');
  }

  final _$postOfferAsyncAction = AsyncAction('postOffer');

  @override
  Future<void> postOffer(TradeOffer offer) {
    return _$postOfferAsyncAction.run(() => super.postOffer(offer));
  }

  final _$acceptOfferAsyncAction = AsyncAction('acceptOffer');

  @override
  Future<void> acceptOffer(TradeOffer offer) {
    return _$acceptOfferAsyncAction.run(() => super.acceptOffer(offer));
  }

  final _$rejectOfferAsyncAction = AsyncAction('rejectOffer');

  @override
  Future<void> rejectOffer(TradeOffer offer) {
    return _$rejectOfferAsyncAction.run(() => super.rejectOffer(offer));
  }

  final _$_MatchStoreActionController = ActionController(name: '_MatchStore');

  @override
  void init(String matchId, String clientUserId) {
    final _$actionInfo = _$_MatchStoreActionController.startAction();
    try {
      return super.init(matchId, clientUserId);
    } finally {
      _$_MatchStoreActionController.endAction(_$actionInfo);
    }
  }
}
