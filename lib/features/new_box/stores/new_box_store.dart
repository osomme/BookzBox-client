import 'package:bookzbox/features/box/models/book.dart';
import 'package:bookzbox/features/new_box/repositories/book_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'new_box_store.g.dart';

class NewBoxStore = _NewBoxStore with _$NewBoxStore;

abstract class _NewBoxStore with Store {
  final IBookRepository _bookRepository;

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

  _NewBoxStore(this._bookRepository);

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
  void addCurrentBook() {
    if (_currentBook == null) return;

    books.add(_currentBook);
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
    return !isISBN(_isbn) ? "Invalid ISBN" : null;
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
  void setBoxTitle(String title) => _boxTitle = title;

  @computed
  String get boxDescription => _boxDescription;

  @action
  void setBoxDescription(String description) => _boxDescription = description;

  @computed
  String get lookupErrorMsg => (_lookupErrorMsg == null ? '' : _lookupErrorMsg);

  @action
  void setLookupErrorMsg(String msg) => _lookupErrorMsg = msg;
}
