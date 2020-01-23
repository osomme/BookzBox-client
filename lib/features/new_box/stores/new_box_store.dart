import 'package:bookzbox/features/box/models/book.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'new_box_store.g.dart';

class NewBoxStore = _NewBoxStore with _$NewBoxStore;

abstract class _NewBoxStore with Store {
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
  ObservableList<Book> _books = new ObservableList();

  /// Attempts to find a book by using the user provided ISBN.
  /// @returns false if the isbn is invalid and true if lookup was
  ///          successfull. A successful lookup does not mean the book was found.
  ///          The @lookupBook is set to NULL if the book was not found and the function
  ///          returned true.
  @action
  Future<bool> findBook() async {
    if (!isIsbn(_isbn)) return false;

    _isLoadingBook = true;
    print("Looking up book with ISBN: " + _isbn);
    // TODO execute isbn lookup
    await sleep2();
    _currentBook =
        new Book(_isbn, "Harry Potter", "", "", "Elsa Rockwell", 550, "123.1", null, 2002);
    books.add(_currentBook);
    _isbn = null;
    _isLoadingBook = false;
    return true;
  }

  Future sleep2() {
    // TODO: remove after implementing ISBN lookup service.
    return new Future.delayed(const Duration(seconds: 2), () => "2");
  }

  @action
  void setIsbn(String isbn) => _isbn = isbn;

  @computed
  String get isbnErrorMsg {
    if (_isbn == null) {
      return null;
    }
    return !isIsbn(_isbn) ? "Invalid ISBN" : null;
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

  bool isIsbn(String isbn) {
    if (_isbn == null || (_isbn.length != 10 && _isbn.length != 13)) {
      return false;
    }
    return isNumeric(isbn);
  }
}
