import 'package:hive/hive.dart';

abstract class ILocalStorage<T> {
  /// Persist a single item.
  Future<void> store(String boxKey, T item);

  /// Persists a `List` of items.
  Future<void> storeAll(String boxKey, List<T> items);

  /// Remove a single item by its unique [key].
  Future<void> remove(String boxKey, dynamic itemKey);

  /// Get the Hive Box
  Future<Box<T>> getBox(String boxKey);

  /// Get a list of the stored items for a user.
  Future<List<T>> getItems(String userId);
}
