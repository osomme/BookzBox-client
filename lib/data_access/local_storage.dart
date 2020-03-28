import 'package:hive/hive.dart';

abstract class ILocalStorage<T> {
  void store(T item);
  void storeAll(List<T> items);
  void remove(dynamic key);

  /// Get the Hive Box
  Future<Box<T>> getBox();
}
