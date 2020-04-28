import 'package:hive/hive.dart';

abstract class ILocalStorage<T> {
  /// Persist a single item.
  void store(T item);

  /// Persists a `List` of items.
  void storeAll(List<T> items);

  /// Remove a single item by its unique [key].
  void remove(dynamic key);

  /// Get the Hive Box
  Future<Box<T>> getBox();

  /// Get a list of the stored items.
  Future<List<T>> getItems();
}
