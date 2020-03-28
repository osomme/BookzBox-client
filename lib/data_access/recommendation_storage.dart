import 'package:bookzbox/data_access/HiveBox.dart';
import 'package:bookzbox/data_access/local_storage.dart';
import 'package:bookzbox/features/feed/models/box_feed_list_item.dart';
import 'package:hive/hive.dart';

class RecommendationStorage extends ILocalStorage<BoxFeedListItem> {
  Box<BoxFeedListItem> _box;

  @override
  Future<Box<BoxFeedListItem>> getBox() async {
    if (_box == null || !_box.isOpen) {
      _box = await Hive.openBox(HiveBox.recommendations);
    }
    return _box;
  }

  @override
  void store(item) {
    _box.add(item);
  }

  @override
  void storeAll(List<BoxFeedListItem> items) {
    _box.addAll(items);
  }

  @override
  void remove(dynamic key) {
    _box.delete(key);
  }
}
