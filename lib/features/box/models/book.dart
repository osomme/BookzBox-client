/// Represents a book.
class Book {
  final String isbn;
  final String title;
  final String subtitle;
  final String thumbnailUrl;
  final String fullSizeImageUrl;
  final String author;
  final int pageCount;
  final String deweyDecimal;
  final List<String> links;
  final int publishYear;

  Book(this.isbn, this.title, this.subtitle, this.thumbnailUrl, this.fullSizeImageUrl,
      this.author, this.pageCount, this.deweyDecimal, this.links, this.publishYear);
}

class Book2 {
  final String isbn13;
  final String isbn10;
  final String title;
  final String subtitle;
  final String thumbnailUrl;
  final String fullSizeImageUrl;
  final List<String> authors;
  final int pageCount;
  final List<String> categories;
  final int publishYear;
  final String synopsis;
  final String publisher;

  Book2({
    this.isbn13,
    this.isbn10,
    this.title,
    this.subtitle,
    this.thumbnailUrl,
    this.fullSizeImageUrl,
    this.authors,
    this.pageCount,
    this.categories,
    this.publishYear,
    this.synopsis,
    this.publisher,
  });
}
