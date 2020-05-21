/// Enum type representing an error related to the map services.
enum MapError {
  /// Failed to load boxes.
  boxError,

  /// Application does not have permissions to load user device position.
  noLocationPermissions,
}
