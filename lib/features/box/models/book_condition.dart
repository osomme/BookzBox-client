/// Represents the current condition of a book.
enum BookCondition {
  Unknown,

  /// The book is brand-new and has not been used.
  New,

  /// Perfect working condition.
  UsedLikeNew,

  /// The book may show some cosmetic damage such as scratches, but remains in good condition.
  UsedGood,

  /// The book is fairly worn, but is still complete and can be read without issues.
  UsedAcceptable,

  /// The book is damaged. Missing or partial pages may occur.
  UsedDamaged,
}
