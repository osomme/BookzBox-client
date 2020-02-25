// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_like_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BoxLikeStore on _BoxLikeStore, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading)).value;
  Computed<bool> _$isLikedComputed;

  @override
  bool get isLiked =>
      (_$isLikedComputed ??= Computed<bool>(() => super.isLiked)).value;
  Computed<NetworkError> _$errorMessageComputed;

  @override
  NetworkError get errorMessage => (_$errorMessageComputed ??=
          Computed<NetworkError>(() => super.errorMessage))
      .value;

  final _$_isLoadingAtom = Atom(name: '_BoxLikeStore._isLoading');

  @override
  bool get _isLoading {
    _$_isLoadingAtom.context.enforceReadPolicy(_$_isLoadingAtom);
    _$_isLoadingAtom.reportObserved();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.context.conditionallyRunInAction(() {
      super._isLoading = value;
      _$_isLoadingAtom.reportChanged();
    }, _$_isLoadingAtom, name: '${_$_isLoadingAtom.name}_set');
  }

  final _$_isLikedAtom = Atom(name: '_BoxLikeStore._isLiked');

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

  final _$_errorAtom = Atom(name: '_BoxLikeStore._error');

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

  final _$_addLikeAsyncAction = AsyncAction('_addLike');

  @override
  Future<void> _addLike() {
    return _$_addLikeAsyncAction.run(() => super._addLike());
  }

  final _$_checkIfLikedAsyncAction = AsyncAction('_checkIfLiked');

  @override
  Future<void> _checkIfLiked() {
    return _$_checkIfLikedAsyncAction.run(() => super._checkIfLiked());
  }
}
