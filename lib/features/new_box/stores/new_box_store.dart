import 'package:bookzbox/common/utils/Location.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/box/models/book.dart';
import 'package:bookzbox/features/box/models/book_condition.dart';
import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/location/location.dart';
import 'package:bookzbox/features/new_box/models/box_error.dart';
import 'package:bookzbox/features/new_box/models/lookup_error.dart';
import 'package:bookzbox/features/new_box/models/scan_error.dart';
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
  final ILocationService _locationService;

  @observable
  String _isbn;

  /// The book that was looked up most recently.
  @observable
  Book _currentBook;

  /// Book condition of the book currently active/ in-focus.
  @observable
  BookCondition _currentBookCondition = BookCondition.Unknown;

  @observable
  bool _isLoadingBook = false;

  @observable
  String _boxTitle;

  @observable
  String _boxDescription;

  @observable
  LookupError _lookupError = LookupError.None;

  @observable
  ObservableList<Book> _books = new ObservableList();

  @observable
  BoxError _bookCountError = BoxError.None;

  @observable
  BoxError _titleError = BoxError.None;

  @observable
  bool _isPublishing = false;

  @observable
  bool _isIsbnInfoBoxExpanded = false;

  @observable
  ScanError _isbnScanError = ScanError.None;

  @observable
  PublishError _publishError = PublishError.None;

  _NewBoxStore(this._bookRepository, this._boxRepository, this._locationService);

  /// Attempts to find a book by using the user provided ISBN.
  /// Returns `false` if the [_isbn] is invalid and `true` if lookup was
  /// successfull. A successful lookup does not mean the book was found.
  /// The [_currentBook] is set to `null` if the book was not found and the function
  /// returned true.
  @action
  Future<bool> findBook() async {
    if (_isbn == null || !isISBN(_isbn)) return false;

    _lookupError = LookupError.None;
    _isLoadingBook = true;
    final result = await _bookRepository.isbnLookup(_isbn.replaceAll('-', ''));
    result.fold(
      (error) => _currentBook = null,
      (book) => _currentBook = book,
    );

    _isbn = null;
    _isLoadingBook = false;

    if (_currentBook == null) {
      _lookupError = LookupError.NotFound;
      return false;
    }

    return true;
  }

  /// Create and publish a box with [user] as the publisher.
  ///
  /// Returns either an error or the published box.
  @action
  Future<Either<PublishError, Box>> publishBox(final User user) async {
    if (!isBoxContentValid()) return left(PublishError.Invalid);
    _isPublishing = true;

    final location = await _locationService.getLocation();
    final result = location.fold(
      (error) {
        print('Failed to obtain location in new_box_store with error code: $error');
        return left(PublishError.NoLocation);
      },
      (p) async {
        final box = Box(
          id: null,
          publisher: user,
          books: _books,
          status: BoxStatus.public,
          publishDateTime: DateTime.now(),
          latitude: Location.getCoordAt250mAccuracy(p.latitude),
          longitude: Location.getCoordAt250mAccuracy(p.longitude),
          title: _boxTitle,
          description: _boxDescription,
        );
        return await _boxRepository.publish(box);
      },
    );

    _isPublishing = false;
    return result;
  }

  @action
  bool addCurrentBook() {
    if (_currentBook == null || _currentBook.condition == BookCondition.Unknown) return false;
    books.add(_currentBook);
    validateBooks();
    return true;
  }

  @action
  void removeBook(Book book) {
    if (book == null) return;

    books.remove(book);
  }

  @action
  void setIsbn(String isbn) => _isbn = isbn;

  @computed
  LookupError get isbnError {
    if (_isbn == null) {
      return null;
    }
    return !isISBN(_isbn) ? LookupError.InvalidIsbn : LookupError.None;
  }

  @computed
  ObservableList<Book> get books => _books;

  @computed
  Book get currentBook => _currentBook;

  @action
  void setCurrentBook(Book book) => _currentBook = book;

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
  LookupError get lookupError => _lookupError;

  @action
  void setLookupError(LookupError err) => _lookupError = err;

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

  @computed
  bool get isIsbnInfoBoxExpanded => _isIsbnInfoBoxExpanded;

  @action
  void setIsbnInfoBoxExpandedStatus(bool expanded) => _isIsbnInfoBoxExpanded = expanded;

  @action
  void toggleIsbnInfoBoxExpandedStatus() => _isIsbnInfoBoxExpanded = !_isIsbnInfoBoxExpanded;

  @computed
  ScanError get isbnScanError => _isbnScanError;

  @action
  void setIsbnScanError(ScanError err) => _isbnScanError = err;

  @computed
  BookCondition get currentBookCondition => _currentBookCondition;

  @action
  void setCurrentBookCondition(BookCondition condition) {
    _currentBookCondition = condition;
    _currentBook.condition = condition;
  }

  @action
  void resetBookCondition() {
    _currentBookCondition = BookCondition.Unknown;
  }

  /// Clears fields to the default/ start values for this store.
  @action
  void clear() {
    books.clear();
    _lookupError = LookupError.None;
    _titleError = BoxError.None;
    _bookCountError = BoxError.None;
    _isbnScanError = ScanError.None;
    _boxTitle = "";
    _boxDescription = "";
  }

  @computed
  PublishError get publishError => _publishError;
}
