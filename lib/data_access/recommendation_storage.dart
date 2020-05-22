import 'package:bookzbox/data_access/HiveBox.dart';
import 'package:bookzbox/data_access/local_storage.dart';
import 'package:bookzbox/features/feed/models/box_feed_list_item.dart';
import 'package:hive/hive.dart';

/// A class that handles local storage of box recommendations.
class RecommendationStorage extends ILocalStorage<BoxFeedListItem> {
  Box<BoxFeedListItem> _box;

  /// Get the Hive box identified by [key].
  @override
  Future<Box<BoxFeedListItem>> getBox(String key) async {
    if (_box == null || _box.name != key || !_box.isOpen) {
      _box = await Hive.openBox(key);
    }

    return _box;
  }

  /// Save an [item] to persistent storage in the Hive box
  /// identified by [boxKey].
  @override
  Future<void> store(String boxKey, BoxFeedListItem item) async {
    (await getBox(boxKey)).add(item);
  }

  /// Persist a list of box recommendations ([items]) to the Hive box
  /// identified by [boxKey].
  @override
  Future<void> storeAll(String boxKey, List<BoxFeedListItem> items) async {
    Map<String, BoxFeedListItem> itemMap = new Map();
    for (var item in items) {
      itemMap.putIfAbsent(item.id, () => item);
    }
    (await getBox(boxKey)).putAll(itemMap);
  }

  /// Remove the box with [itemKey] from the Hive box with [boxKey].
  @override
  Future<void> remove(String boxKey, dynamic itemKey) async {
    if (itemKey == null) return;
    (await getBox(boxKey)).delete(itemKey);
  }

  /// Get all stored box recommendations.
  @override
  Future<List<BoxFeedListItem>> getItems(String userId) async {
    return (await getBox(userId + HiveBox.recommendations)).values.toList();
  }
}
