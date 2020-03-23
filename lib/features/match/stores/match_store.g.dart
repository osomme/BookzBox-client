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

  final _$postOfferAsyncAction = AsyncAction('postOffer');

  @override
  Future<void> postOffer(TradeOffer offer) {
    return _$postOfferAsyncAction.run(() => super.postOffer(offer));
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
