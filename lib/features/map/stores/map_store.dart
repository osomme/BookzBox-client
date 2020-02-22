import 'package:bookzbox/features/feed/feed.dart';
import 'package:mobx/mobx.dart';

part 'map_store.g.dart';

class MapStore = _MapStore with _$MapStore;

abstract class _MapStore with Store {
  @observable
  BoxFeedListItem _box;

  @computed
  BoxFeedListItem get box => _box;

  @computed
  bool get detailsWindowOpen => _box != null;

  @action
  void setCurrentBox(BoxFeedListItem box) => this._box = box;

  @action
  void removeCurrentBox() => _box = null;
}
