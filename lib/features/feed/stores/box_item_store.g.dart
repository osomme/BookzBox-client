// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BoxItemStore on _BoxItemStore, Store {
  Computed<bool> _$likeLoadingComputed;

  @override
  bool get likeLoading =>
      (_$likeLoadingComputed ??= Computed<bool>(() => super.likeLoading)).value;
  Computed<bool> _$isLikedComputed;

  @override
  bool get isLiked =>
      (_$isLikedComputed ??= Computed<bool>(() => super.isLiked)).value;
  Computed<NetworkError> _$errorMessageComputed;

  @override
  NetworkError get errorMessage => (_$errorMessageComputed ??=
          Computed<NetworkError>(() => super.errorMessage))
      .value;

  final _$_likeIsLoadingAtom = Atom(name: '_BoxItemStore._likeIsLoading');

  @override
  bool get _likeIsLoading {
    _$_likeIsLoadingAtom.context.enforceReadPolicy(_$_likeIsLoadingAtom);
    _$_likeIsLoadingAtom.reportObserved();
    return super._likeIsLoading;
  }

  @override
  set _likeIsLoading(bool value) {
    _$_likeIsLoadingAtom.context.conditionallyRunInAction(() {
      super._likeIsLoading = value;
      _$_likeIsLoadingAtom.reportChanged();
    }, _$_likeIsLoadingAtom, name: '${_$_likeIsLoadingAtom.name}_set');
  }

  final _$_isLikedAtom = Atom(name: '_BoxItemStore._isLiked');

  @override
  bool get _isLiked {
    _$_isLikedAtom.context.enforceReadPolicy(_$_isLikedAtom);
    _$_isLikedAtom.reportObserved();
    return super._isLiked;
  }

  @override
  set _isLiked(bool value) {
    _$_isLikedAtom.context.conditionallyRunInAction(() {
      super._isLiked = value;
      _$_isLikedAtom.reportChanged();
    }, _$_isLikedAtom, name: '${_$_isLikedAtom.name}_set');
  }

  final _$_errorAtom = Atom(name: '_BoxItemStore._error');

  @override
  NetworkError get _error {
    _$_errorAtom.context.enforceReadPolicy(_$_errorAtom);
    _$_errorAtom.reportObserved();
    return super._error;
  }

  @override
  set _error(NetworkError value) {
    _$_errorAtom.context.conditionallyRunInAction(() {
      super._error = value;
      _$_errorAtom.reportChanged();
    }, _$_errorAtom, name: '${_$_errorAtom.name}_set');
  }

  final _$toggleLikeStatusAsyncAction = AsyncAction('toggleLikeStatus');

  @override
  Future<void> toggleLikeStatus() {
    return _$toggleLikeStatusAsyncAction.run(() => super.toggleLikeStatus());
  }

  final _$_removeLikeAsyncAction = AsyncAction('_removeLike');

  @override
  Future<void> _removeLike() {
    return _$_removeLikeAsyncAction.run(() => super._removeLike());
  }

  final _$_likeBoxAsyncAction = AsyncAction('_likeBox');

  @override
  Future<void> _likeBox() {
    return _$_likeBoxAsyncAction.run(() => super._likeBox());
  }

  final _$_checkIfLikedAsyncAction = AsyncAction('_checkIfLiked');

  @override
  Future<void> _checkIfLiked() {
    return _$_checkIfLikedAsyncAction.run(() => super._checkIfLiked());
  }
}
