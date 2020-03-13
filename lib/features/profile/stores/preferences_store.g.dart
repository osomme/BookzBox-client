// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PreferencesStore on _PreferencesStore, Store {
  Computed<BookSubject> _$selectedSubjectComputed;

  @override
  BookSubject get selectedSubject => (_$selectedSubjectComputed ??=
          Computed<BookSubject>(() => super.selectedSubject))
      .value;

  final _$favoriteBookSubjectsAtom =
      Atom(name: '_PreferencesStore.favoriteBookSubjects');

  @override
  ObservableList<BookSubject> get favoriteBookSubjects {
    _$favoriteBookSubjectsAtom.context
        .enforceReadPolicy(_$favoriteBookSubjectsAtom);
    _$favoriteBookSubjectsAtom.reportObserved();
    return super.favoriteBookSubjects;
  }

  @override
  set favoriteBookSubjects(ObservableList<BookSubject> value) {
    _$favoriteBookSubjectsAtom.context.conditionallyRunInAction(() {
      super.favoriteBookSubjects = value;
      _$favoriteBookSubjectsAtom.reportChanged();
    }, _$favoriteBookSubjectsAtom,
        name: '${_$favoriteBookSubjectsAtom.name}_set');
  }

  final _$_selectedSubjectAtom =
      Atom(name: '_PreferencesStore._selectedSubject');

  @override
  BookSubject get _selectedSubject {
    _$_selectedSubjectAtom.context.enforceReadPolicy(_$_selectedSubjectAtom);
    _$_selectedSubjectAtom.reportObserved();
    return super._selectedSubject;
  }

  @override
  set _selectedSubject(BookSubject value) {
    _$_selectedSubjectAtom.context.conditionallyRunInAction(() {
      super._selectedSubject = value;
      _$_selectedSubjectAtom.reportChanged();
    }, _$_selectedSubjectAtom, name: '${_$_selectedSubjectAtom.name}_set');
  }

  final _$addBookSubjectAsyncAction = AsyncAction('addBookSubject');

  @override
  Future<dynamic> addBookSubject(BookSubject subject) {
    return _$addBookSubjectAsyncAction.run(() => super.addBookSubject(subject));
  }

  final _$removeBookSubjectAsyncAction = AsyncAction('removeBookSubject');

  @override
  Future<dynamic> removeBookSubject(BookSubject subject) {
    return _$removeBookSubjectAsyncAction
        .run(() => super.removeBookSubject(subject));
  }

  final _$_PreferencesStoreActionController =
      ActionController(name: '_PreferencesStore');

  @override
  void setSelectedSubject(BookSubject subject) {
    final _$actionInfo = _$_PreferencesStoreActionController.startAction();
    try {
      return super.setSelectedSubject(subject);
    } finally {
      _$_PreferencesStoreActionController.endAction(_$actionInfo);
    }
  }
}
