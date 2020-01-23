/// Represents a book.
class Book {
  final String isbn;
  final String title;
  final String thumbnailUrl;
  final String fullSizeImageUrl;
  final String author;
  final int pageCount;
  final String deweyDecimal;
  final List<String> links;
  final int publishYear;

  Book(this.isbn, this.title, this.thumbnailUrl, this.fullSizeImageUrl, this.author, this.pageCount,
      this.deweyDecimal, this.links, this.publishYear);
}
