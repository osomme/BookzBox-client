import 'package:bookzbox/features/box/models/models.dart';
import 'package:mobx/mobx.dart';

part 'box_item_store.g.dart';

class BoxItemStore = _BoxItemStore with _$BoxItemStore;

abstract class _BoxItemStore with Store {
  @observable
  bool _likeLoading = false;

  @computed
  bool get likeLoading => _likeLoading;

  @action
  Future<void> likeBox(Box box) async {
    _likeLoading = true;
    _likeLoading = false;
  }
}
