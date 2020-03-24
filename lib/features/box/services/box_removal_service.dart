import 'package:bookzbox/features/box/models/box.dart';

abstract class IBoxRemovalService {
  Future<bool> remove(String boxId);
}
