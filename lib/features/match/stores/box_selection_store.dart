import 'package:bookzbox/features/box/box.dart';
import 'package:bookzbox/features/new_box/repositories/box_repository.dart';
import 'package:mobx/mobx.dart';

part 'box_selection_store.g.dart';

class BoxSelectionStore = _BoxSelectionStore with _$BoxSelectionStore;

abstract class _BoxSelectionStore with Store {
  final IBoxRepository _boxRepository;

  @observable
  List<MiniBox> _boxes = List();

  @observable
  bool _isLoading = false;

  @observable
  bool _hasError = false;

  @observable
  MiniBox _currentlySelected;

  _BoxSelectionStore(this._boxRepository);

  @computed
  List<MiniBox> get boxes => _boxes.where((b) => b.status != BoxStatus.traded).toList();

  @computed
  bool get isLoading => _isLoading;

  @computed
  bool get hasError => _hasError;

  @computed
  MiniBox get currentlySelected => _currentlySelected;

  @action
  void setCurrentlySelected(MiniBox box) => _currentlySelected = box;

  @action
  Future<void> init(String userId) async {
    _isLoading = true;
    _hasError = false;
    final result = await _boxRepository.fetchUserBoxes(userId);
    result.fold(
      (error) => _hasError = true,
      (boxes) => _boxes = boxes,
    );
    _isLoading = false;
  }
}
