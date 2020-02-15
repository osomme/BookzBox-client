import 'package:bookzbox/features/box/models/box.dart';

extension StatusMapper on int {
  BoxStatus toBoxStatus() {
    switch (this) {
      case 0:
        return BoxStatus.public;
      case 1:
        return BoxStatus.private;
      case 2:
        return BoxStatus.traded;
      default:
        throw 'Failed to map $this to BoxStatus';
    }
  }
}
