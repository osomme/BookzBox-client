import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/box/models/book.dart';
import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/new_box/models/box_error.dart';
import 'package:bookzbox/features/new_box/repositories/book_repository.dart';
import 'package:bookzbox/features/new_box/repositories/box_repository.dart';
import 'package:bookzbox/features/new_box/services/publish_error.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'new_box_store.g.dart';

class NewBoxStore = _NewBoxStore with _$NewBoxStore;

abstract class _NewBoxStore with Store {
  final IBookRepository _bookRepository;
  final IBoxRepository _boxRepository;

  @observable
  String _isbn;

  /// The book that was looked up most recently.
  @observable
  Book _currentBook;

  @observable
  bool _isLoadingBook = false;

  @observable
  String _boxTitle;

  @observable
  String _boxDescription;

  @observable
  String _lookupErrorMsg;

  @observable
  ObservableList<Book> _books = new ObservableList();

  @observable
  BoxError _bookCountError = BoxError.None;

  @observable
  BoxError _titleError = BoxError.None;

  @observable
  bool _isPublishing = false;

  _NewBoxStore(this._bookRepository, this._boxRepository);

  /// Attempts to find a book by using the user provided ISBN.
  /// @returns false if the isbn is invalid and true if lookup was
  ///          successfull. A successful lookup does not mean the book was found.
  ///          The @lookupBook is set to NULL if the book was not found and the function
  ///          returned true.
  @action
  Future<bool> findBook() async {
    if (_isbn == null || !isISBN(_isbn)) return false;

    _isLoadingBook = true;
    final result = await _bookRepository.isbnLookup(_isbn.replaceAll('-', ''));
    result.fold(
      (error) => _currentBook = null,
      (book) => _currentBook = book,
    );

    _isbn = null;
    _isLoadingBook = false;

    if (_currentBook == null) {
      _lookupErrorMsg = 'Book not found';
      return false;
    }

    return true;
  }

  @action
  Future<Either<PublishError, Box>> publishBox(final User user) async {
    if (!isBoxContentValid()) return left(PublishError.Invalid);
    Box toPublish = Box(
        id: null,
        publisher: user,
        books: _books,
        status: BoxStatus.public,
        publishDateTime: DateTime.now(),
        latitude: 12.0, // TODO add actual position
        longitude: 69.0,
        title: _boxTitle,
        description: _boxDescription);
    _isPublishing = true;
    final res = await _boxRepository.publish(toPublish);
    _isPublishing = false;
    return res;
  }

  @action
  void addCurrentBook() {
    if (_currentBook == null) return;

    books.add(_currentBook);
    validateBooks();
  }

  @action
  void removeBook(Book book) {
    if (book == null) return;

    books.remove(book);
  }

  @action
  void setIsbn(String isbn) => _isbn = isbn;

  @computed
  String get isbnErrorMsg {
    if (_isbn == null) {
      return null;
    }
    return !isISBN(_isbn) ? "Invalid ISBN" : '';
  }

  @computed
  ObservableList<Book> get books => _books;

  @computed
  Book get currentBook => _currentBook;

  @computed
  bool get isLoadingBook => _isLoadingBook;

  @computed
  String get boxTitle => _boxTitle;

  @action
  void setBoxTitle(String title) {
    _boxTitle = title;
    validateTitle();
  }

  @computed
  String get boxDescription => _boxDescription;

  @action
  void setBoxDescription(String description) => _boxDescription = description;

  @computed
  String get lookupErrorMsg => (_lookupErrorMsg == null ? '' : _lookupErrorMsg);

  @action
  void setLookupErrorMsg(String msg) => _lookupErrorMsg = msg;

  @computed
  BoxError get titleError => _titleError;

  @action
  void setTitleError(BoxError err) => _titleError = err;

  @computed
  BoxError get bookCountError => _bookCountError;

  @computed
  bool get isPublishing => _isPublishing;

  @action
  void setBookCountError(BoxError err) => _bookCountError = err;

  bool isBoxContentValid() {
    bool isValid = true;

    if (!validateBooks()) {
      isValid = false;
    }

    if (!validateTitle()) {
      isValid = false;
    }

    return isValid;
  }

  @action
  bool validateBooks() {
    if (_books == null || _books.length < 1) {
      _bookCountError = BoxError.InvalidBookCount;
      return false;
    }
    _bookCountError = BoxError.None;
    return true;
  }

  @action
  bool validateTitle() {
    if (_boxTitle == null || _boxTitle.length <= 3) {
      _titleError = BoxError.InvalidTitle;
      return false;
    }
    _titleError = BoxError.None;
    return true;
  }
}
