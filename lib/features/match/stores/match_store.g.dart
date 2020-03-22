// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MatchStore on _MatchStore, Store {
  Computed<Option<TradeOffer>> _$lastOfferComputed;

  @override
  Option<TradeOffer> get lastOffer => (_$lastOfferComputed ??=
          Computed<Option<TradeOffer>>(() => super.lastOffer))
      .value;
  Computed<bool> _$clientUserHasPendingOfferComputed;

  @override
  bool get clientUserHasPendingOffer => (_$clientUserHasPendingOfferComputed ??=
          Computed<bool>(() => super.clientUserHasPendingOffer))
      .value;
  Computed<bool> _$doesOtherUserHaveOfferComputed;

  @override
  bool get doesOtherUserHaveOffer => (_$doesOtherUserHaveOfferComputed ??=
          Computed<bool>(() => super.doesOtherUserHaveOffer))
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

  final _$_matchIsActiveAtom = Atom(name: '_MatchStore._matchIsActive');

  @override
  bool get _matchIsActive {
    _$_matchIsActiveAtom.context.enforceReadPolicy(_$_matchIsActiveAtom);
    _$_matchIsActiveAtom.reportObserved();
    return super._matchIsActive;
  }

  @override
  set _matchIsActive(bool value) {
    _$_matchIsActiveAtom.context.conditionallyRunInAction(() {
      super._matchIsActive = value;
      _$_matchIsActiveAtom.reportChanged();
    }, _$_matchIsActiveAtom, name: '${_$_matchIsActiveAtom.name}_set');
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
