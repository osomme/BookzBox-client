// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MatchStore on _MatchStore, Store {
  Computed<bool> _$isPostingTradeOfferComputed;

  @override
  bool get isPostingTradeOffer => (_$isPostingTradeOfferComputed ??=
          Computed<bool>(() => super.isPostingTradeOffer))
      .value;
  Computed<bool> _$isMatchActiveComputed;

  @override
  bool get isMatchActive =>
      (_$isMatchActiveComputed ??= Computed<bool>(() => super.isMatchActive))
          .value;

  final _$_isPostingTradeOfferAtom =
      Atom(name: '_MatchStore._isPostingTradeOffer');

  @override
  bool get _isPostingTradeOffer {
    _$_isPostingTradeOfferAtom.context
        .enforceReadPolicy(_$_isPostingTradeOfferAtom);
    _$_isPostingTradeOfferAtom.reportObserved();
    return super._isPostingTradeOffer;
  }

  @override
  set _isPostingTradeOffer(bool value) {
    _$_isPostingTradeOfferAtom.context.conditionallyRunInAction(() {
      super._isPostingTradeOffer = value;
      _$_isPostingTradeOfferAtom.reportChanged();
    }, _$_isPostingTradeOfferAtom,
        name: '${_$_isPostingTradeOfferAtom.name}_set');
  }

  final _$_isMatchActiveAtom = Atom(name: '_MatchStore._isMatchActive');

  @override
  bool get _isMatchActive {
    _$_isMatchActiveAtom.context.enforceReadPolicy(_$_isMatchActiveAtom);
    _$_isMatchActiveAtom.reportObserved();
    return super._isMatchActive;
  }

  @override
  set _isMatchActive(bool value) {
    _$_isMatchActiveAtom.context.conditionallyRunInAction(() {
      super._isMatchActive = value;
      _$_isMatchActiveAtom.reportChanged();
    }, _$_isMatchActiveAtom, name: '${_$_isMatchActiveAtom.name}_set');
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
  void init(String matchId) {
    final _$actionInfo = _$_MatchStoreActionController.startAction();
    try {
      return super.init(matchId);
    } finally {
      _$_MatchStoreActionController.endAction(_$actionInfo);
    }
  }
}
