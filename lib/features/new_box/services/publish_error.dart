/// The possible error cases of a publish operation.
enum PublishError {
  None,

  /// The data is invalid.
  Invalid,

  /// The operation took too long.
  TimeOut,

  /// The location could not be retreived.
  NoLocation,
}
