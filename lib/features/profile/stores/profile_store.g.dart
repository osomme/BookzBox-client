// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStore, Store {
  Computed<BoxStatus> _$currentBoxStatusComputed;

  @override
  BoxStatus get currentBoxStatus => (_$currentBoxStatusComputed ??=
          Computed<BoxStatus>(() => super.currentBoxStatus))
      .value;
  Computed<Profile> _$profileComputed;

  @override
  Profile get profile =>
      (_$profileComputed ??= Computed<Profile>(() => super.profile)).value;
  Computed<bool> _$isMyProfileComputed;

  @override
  bool get isMyProfile =>
      (_$isMyProfileComputed ??= Computed<bool>(() => super.isMyProfile)).value;

  final _$myBoxesAtom = Atom(name: '_ProfileStore.myBoxes');

  @override
  ObservableList<MyBox> get myBoxes {
    _$myBoxesAtom.context.enforceReadPolicy(_$myBoxesAtom);
    _$myBoxesAtom.reportObserved();
    return super.myBoxes;
  }

  @override
  set myBoxes(ObservableList<MyBox> value) {
    _$myBoxesAtom.context.conditionallyRunInAction(() {
      super.myBoxes = value;
      _$myBoxesAtom.reportChanged();
    }, _$myBoxesAtom, name: '${_$myBoxesAtom.name}_set');
  }

  final _$_isMyProfileAtom = Atom(name: '_ProfileStore._isMyProfile');

  @override
  bool get _isMyProfile {
    _$_isMyProfileAtom.context.enforceReadPolicy(_$_isMyProfileAtom);
    _$_isMyProfileAtom.reportObserved();
    return super._isMyProfile;
  }

  @override
  set _isMyProfile(bool value) {
    _$_isMyProfileAtom.context.conditionallyRunInAction(() {
      super._isMyProfile = value;
      _$_isMyProfileAtom.reportChanged();
    }, _$_isMyProfileAtom, name: '${_$_isMyProfileAtom.name}_set');
  }

  final _$_profileAtom = Atom(name: '_ProfileStore._profile');

  @override
  Profile get _profile {
    _$_profileAtom.context.enforceReadPolicy(_$_profileAtom);
    _$_profileAtom.reportObserved();
    return super._profile;
  }

  @override
  set _profile(Profile value) {
    _$_profileAtom.context.conditionallyRunInAction(() {
      super._profile = value;
      _$_profileAtom.reportChanged();
    }, _$_profileAtom, name: '${_$_profileAtom.name}_set');
  }

  final _$_currentBoxStatusAtom = Atom(name: '_ProfileStore._currentBoxStatus');

  @override
  BoxStatus get _currentBoxStatus {
    _$_currentBoxStatusAtom.context.enforceReadPolicy(_$_currentBoxStatusAtom);
    _$_currentBoxStatusAtom.reportObserved();
    return super._currentBoxStatus;
  }

  @override
  set _currentBoxStatus(BoxStatus value) {
    _$_currentBoxStatusAtom.context.conditionallyRunInAction(() {
      super._currentBoxStatus = value;
      _$_currentBoxStatusAtom.reportChanged();
    }, _$_currentBoxStatusAtom, name: '${_$_currentBoxStatusAtom.name}_set');
  }

  final _$_userIdAtom = Atom(name: '_ProfileStore._userId');

  @override
  String get _userId {
    _$_userIdAtom.context.enforceReadPolicy(_$_userIdAtom);
    _$_userIdAtom.reportObserved();
    return super._userId;
  }

  @override
  set _userId(String value) {
    _$_userIdAtom.context.conditionallyRunInAction(() {
      super._userId = value;
      _$_userIdAtom.reportChanged();
    }, _$_userIdAtom, name: '${_$_userIdAtom.name}_set');
  }

  final _$_ProfileStoreActionController =
      ActionController(name: '_ProfileStore');

  @override
  void init() {
    final _$actionInfo = _$_ProfileStoreActionController.startAction();
    try {
      return super.init();
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserId(String uid) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction();
    try {
      return super.setUserId(uid);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentBoxStatus(BoxStatus status) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction();
    try {
      return super.setCurrentBoxStatus(status);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }
}
