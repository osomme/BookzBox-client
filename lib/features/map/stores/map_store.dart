import 'package:bookzbox/features/feed/feed.dart';
import 'package:mobx/mobx.dart';

part 'map_store.g.dart';

class MapStore = _MapStore with _$MapStore;

abstract class _MapStore with Store {
  @observable
  BoxFeedListItem box;

  @computed
  bool get detailsWindowOpen => box != null;

  @action
  void setCurrentBox(BoxFeedListItem box) => this.box = box;
}
