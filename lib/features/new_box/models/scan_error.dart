/// Represents the errors that can occur when scanning ISBN
/// using the barcode scanner.
enum ScanError {
  /// No error.
  None,

  /// User disabled camera for the app.
  PermissionDenied,

  /// User pressed back without scanning
  BackPressed,

  /// Unknown error
  Unknown,
}
