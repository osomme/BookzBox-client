import 'package:bookzbox/features/box/box.dart';
import 'package:bookzbox/features/new_box/repositories/box_repository.dart';
import 'package:mobx/mobx.dart';

part 'box_selection_store.g.dart';

/// Store responsible for handling logic related to selecting a box from a list of boxes that the user has published.
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

  /// Returns a list of boxes belonging to the user, that are not traded. Can include private boxes.
  @computed
  List<MiniBox> get boxes => _boxes.where((b) => b.status != BoxStatus.traded).toList();

  /// Whether the boxes are currently being loaded.
  @computed
  bool get isLoading => _isLoading;

  /// Whether the box loading has caused an error.
  @computed
  bool get hasError => _hasError;

  /// The currently selected box.
  @computed
  MiniBox get currentlySelected => _currentlySelected;

  /// Sets the currently selected box.
  ///
  /// [box] The box that the user wishes to trade.
  @action
  void setCurrentlySelected(MiniBox box) => _currentlySelected = box;

  /// Initializes the store by loading all available boxes belonging to the user.
  ///
  /// [userId] The ID of the user whose boxes are to be loaded.
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
