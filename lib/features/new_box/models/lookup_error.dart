/// Represents an error that may occur during the book lookup process.
enum LookupError {
  None,

  /// The ISBN is not valid.
  InvalidIsbn,

  /// The book was not found.
  NotFound,
}
