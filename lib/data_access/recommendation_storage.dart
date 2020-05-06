import 'package:bookzbox/data_access/HiveBox.dart';
import 'package:bookzbox/data_access/local_storage.dart';
import 'package:bookzbox/features/feed/models/box_feed_list_item.dart';
import 'package:hive/hive.dart';

/// A class that handles local storage of box recommendations.
class RecommendationStorage extends ILocalStorage<BoxFeedListItem> {
  Box<BoxFeedListItem> _box;

  @override
  Future<Box<BoxFeedListItem>> getBox(String key) async {
    if (_box == null || _box.name != key || !_box.isOpen) {
      _box = await Hive.openBox(key);
    }

    return _box;
  }

  @override
  void store(item) {
    _box.add(item);
  }

  /// Persist a list of boxes.
  @override
  void storeAll(List<BoxFeedListItem> items) {
    Map<String, BoxFeedListItem> itemMap = new Map();
    for (var item in items) {
      itemMap.putIfAbsent(item.id, () => item);
    }
    _box.putAll(itemMap);
  }

  @override
  void remove(dynamic key) {
    _box.delete(key);
  }

  /// Get all stored box recommendations.
  @override
  Future<List<BoxFeedListItem>> getItems(String userId) async {
    return (await getBox(userId + HiveBox.recommendations)).values.toList();
  }
}
