// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_box_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewBoxStore on _NewBoxStore, Store {
  Computed<String> _$isbnErrorMsgComputed;

  @override
  String get isbnErrorMsg =>
      (_$isbnErrorMsgComputed ??= Computed<String>(() => super.isbnErrorMsg))
          .value;
  Computed<ObservableList<Book>> _$booksComputed;

  @override
  ObservableList<Book> get books =>
      (_$booksComputed ??= Computed<ObservableList<Book>>(() => super.books))
          .value;
  Computed<Book> _$currentBookComputed;

  @override
  Book get currentBook =>
      (_$currentBookComputed ??= Computed<Book>(() => super.currentBook)).value;
  Computed<bool> _$isLoadingBookComputed;

  @override
  bool get isLoadingBook =>
      (_$isLoadingBookComputed ??= Computed<bool>(() => super.isLoadingBook))
          .value;
  Computed<String> _$boxTitleComputed;

  @override
  String get boxTitle =>
      (_$boxTitleComputed ??= Computed<String>(() => super.boxTitle)).value;
  Computed<String> _$boxDescriptionComputed;

  @override
  String get boxDescription => (_$boxDescriptionComputed ??=
          Computed<String>(() => super.boxDescription))
      .value;
  Computed<String> _$lookupErrorMsgComputed;

  @override
  String get lookupErrorMsg => (_$lookupErrorMsgComputed ??=
          Computed<String>(() => super.lookupErrorMsg))
      .value;
  Computed<BoxError> _$titleErrorComputed;

  @override
  BoxError get titleError =>
      (_$titleErrorComputed ??= Computed<BoxError>(() => super.titleError))
          .value;
  Computed<BoxError> _$bookCountErrorComputed;

  @override
  BoxError get bookCountError => (_$bookCountErrorComputed ??=
          Computed<BoxError>(() => super.bookCountError))
      .value;
  Computed<bool> _$isPublishingComputed;

  @override
  bool get isPublishing =>
      (_$isPublishingComputed ??= Computed<bool>(() => super.isPublishing))
          .value;

  final _$_isbnAtom = Atom(name: '_NewBoxStore._isbn');

  @override
  String get _isbn {
    _$_isbnAtom.context.enforceReadPolicy(_$_isbnAtom);
    _$_isbnAtom.reportObserved();
    return super._isbn;
  }

  @override
  set _isbn(String value) {
    _$_isbnAtom.context.conditionallyRunInAction(() {
      super._isbn = value;
      _$_isbnAtom.reportChanged();
    }, _$_isbnAtom, name: '${_$_isbnAtom.name}_set');
  }

  final _$_currentBookAtom = Atom(name: '_NewBoxStore._currentBook');

  @override
  Book get _currentBook {
    _$_currentBookAtom.context.enforceReadPolicy(_$_currentBookAtom);
    _$_currentBookAtom.reportObserved();
    return super._currentBook;
  }

  @override
  set _currentBook(Book value) {
    _$_currentBookAtom.context.conditionallyRunInAction(() {
      super._currentBook = value;
      _$_currentBookAtom.reportChanged();
    }, _$_currentBookAtom, name: '${_$_currentBookAtom.name}_set');
  }

  final _$_isLoadingBookAtom = Atom(name: '_NewBoxStore._isLoadingBook');

  @override
  bool get _isLoadingBook {
    _$_isLoadingBookAtom.context.enforceReadPolicy(_$_isLoadingBookAtom);
    _$_isLoadingBookAtom.reportObserved();
    return super._isLoadingBook;
  }

  @override
  set _isLoadingBook(bool value) {
    _$_isLoadingBookAtom.context.conditionallyRunInAction(() {
      super._isLoadingBook = value;
      _$_isLoadingBookAtom.reportChanged();
    }, _$_isLoadingBookAtom, name: '${_$_isLoadingBookAtom.name}_set');
  }

  final _$_boxTitleAtom = Atom(name: '_NewBoxStore._boxTitle');

  @override
  String get _boxTitle {
    _$_boxTitleAtom.context.enforceReadPolicy(_$_boxTitleAtom);
    _$_boxTitleAtom.reportObserved();
    return super._boxTitle;
  }

  @override
  set _boxTitle(String value) {
    _$_boxTitleAtom.context.conditionallyRunInAction(() {
      super._boxTitle = value;
      _$_boxTitleAtom.reportChanged();
    }, _$_boxTitleAtom, name: '${_$_boxTitleAtom.name}_set');
  }

  final _$_boxDescriptionAtom = Atom(name: '_NewBoxStore._boxDescription');

  @override
  String get _boxDescription {
    _$_boxDescriptionAtom.context.enforceReadPolicy(_$_boxDescriptionAtom);
    _$_boxDescriptionAtom.reportObserved();
    return super._boxDescription;
  }

  @override
  set _boxDescription(String value) {
    _$_boxDescriptionAtom.context.conditionallyRunInAction(() {
      super._boxDescription = value;
      _$_boxDescriptionAtom.reportChanged();
    }, _$_boxDescriptionAtom, name: '${_$_boxDescriptionAtom.name}_set');
  }

  final _$_lookupErrorMsgAtom = Atom(name: '_NewBoxStore._lookupErrorMsg');

  @override
  String get _lookupErrorMsg {
    _$_lookupErrorMsgAtom.context.enforceReadPolicy(_$_lookupErrorMsgAtom);
    _$_lookupErrorMsgAtom.reportObserved();
    return super._lookupErrorMsg;
  }

  @override
  set _lookupErrorMsg(String value) {
    _$_lookupErrorMsgAtom.context.conditionallyRunInAction(() {
      super._lookupErrorMsg = value;
      _$_lookupErrorMsgAtom.reportChanged();
    }, _$_lookupErrorMsgAtom, name: '${_$_lookupErrorMsgAtom.name}_set');
  }

  final _$_booksAtom = Atom(name: '_NewBoxStore._books');

  @override
  ObservableList<Book> get _books {
    _$_booksAtom.context.enforceReadPolicy(_$_booksAtom);
    _$_booksAtom.reportObserved();
    return super._books;
  }

  @override
  set _books(ObservableList<Book> value) {
    _$_booksAtom.context.conditionallyRunInAction(() {
      super._books = value;
      _$_booksAtom.reportChanged();
    }, _$_booksAtom, name: '${_$_booksAtom.name}_set');
  }

  final _$_bookCountErrorAtom = Atom(name: '_NewBoxStore._bookCountError');

  @override
  BoxError get _bookCountError {
    _$_bookCountErrorAtom.context.enforceReadPolicy(_$_bookCountErrorAtom);
    _$_bookCountErrorAtom.reportObserved();
    return super._bookCountError;
  }

  @override
  set _bookCountError(BoxError value) {
    _$_bookCountErrorAtom.context.conditionallyRunInAction(() {
      super._bookCountError = value;
      _$_bookCountErrorAtom.reportChanged();
    }, _$_bookCountErrorAtom, name: '${_$_bookCountErrorAtom.name}_set');
  }

  final _$_titleErrorAtom = Atom(name: '_NewBoxStore._titleError');

  @override
  BoxError get _titleError {
    _$_titleErrorAtom.context.enforceReadPolicy(_$_titleErrorAtom);
    _$_titleErrorAtom.reportObserved();
    return super._titleError;
  }

  @override
  set _titleError(BoxError value) {
    _$_titleErrorAtom.context.conditionallyRunInAction(() {
      super._titleError = value;
      _$_titleErrorAtom.reportChanged();
    }, _$_titleErrorAtom, name: '${_$_titleErrorAtom.name}_set');
  }

  final _$_isPublishingAtom = Atom(name: '_NewBoxStore._isPublishing');

  @override
  bool get _isPublishing {
    _$_isPublishingAtom.context.enforceReadPolicy(_$_isPublishingAtom);
    _$_isPublishingAtom.reportObserved();
    return super._isPublishing;
  }

  @override
  set _isPublishing(bool value) {
    _$_isPublishingAtom.context.conditionallyRunInAction(() {
      super._isPublishing = value;
      _$_isPublishingAtom.reportChanged();
    }, _$_isPublishingAtom, name: '${_$_isPublishingAtom.name}_set');
  }

  final _$findBookAsyncAction = AsyncAction('findBook');

  @override
  Future<bool> findBook() {
    return _$findBookAsyncAction.run(() => super.findBook());
  }

  final _$publishBoxAsyncAction = AsyncAction('publishBox');

  @override
  Future<Either<PublishError, Box>> publishBox(User user) {
    return _$publishBoxAsyncAction.run(() => super.publishBox(user));
  }

  final _$_NewBoxStoreActionController = ActionController(name: '_NewBoxStore');

  @override
  void addCurrentBook() {
    final _$actionInfo = _$_NewBoxStoreActionController.startAction();
    try {
      return super.addCurrentBook();
    } finally {
      _$_NewBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeBook(Book book) {
    final _$actionInfo = _$_NewBoxStoreActionController.startAction();
    try {
      return super.removeBook(book);
    } finally {
      _$_NewBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsbn(String isbn) {
    final _$actionInfo = _$_NewBoxStoreActionController.startAction();
    try {
      return super.setIsbn(isbn);
    } finally {
      _$_NewBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBoxTitle(String title) {
    final _$actionInfo = _$_NewBoxStoreActionController.startAction();
    try {
      return super.setBoxTitle(title);
    } finally {
      _$_NewBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBoxDescription(String description) {
    final _$actionInfo = _$_NewBoxStoreActionController.startAction();
    try {
      return super.setBoxDescription(description);
    } finally {
      _$_NewBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLookupErrorMsg(String msg) {
    final _$actionInfo = _$_NewBoxStoreActionController.startAction();
    try {
      return super.setLookupErrorMsg(msg);
    } finally {
      _$_NewBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitleError(BoxError err) {
    final _$actionInfo = _$_NewBoxStoreActionController.startAction();
    try {
      return super.setTitleError(err);
    } finally {
      _$_NewBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBookCountError(BoxError err) {
    final _$actionInfo = _$_NewBoxStoreActionController.startAction();
    try {
      return super.setBookCountError(err);
    } finally {
      _$_NewBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateBooks() {
    final _$actionInfo = _$_NewBoxStoreActionController.startAction();
    try {
      return super.validateBooks();
    } finally {
      _$_NewBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateTitle() {
    final _$actionInfo = _$_NewBoxStoreActionController.startAction();
    try {
      return super.validateTitle();
    } finally {
      _$_NewBoxStoreActionController.endAction(_$actionInfo);
    }
  }
}
