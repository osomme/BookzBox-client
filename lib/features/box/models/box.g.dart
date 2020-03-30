// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BoxStatusAdapter extends TypeAdapter<BoxStatus> {
  @override
  final typeId = 3;

  @override
  BoxStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BoxStatus.public;
      case 1:
        return BoxStatus.private;
      case 2:
        return BoxStatus.traded;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, BoxStatus obj) {
    switch (obj) {
      case BoxStatus.public:
        writer.writeByte(0);
        break;
      case BoxStatus.private:
        writer.writeByte(1);
        break;
      case BoxStatus.traded:
        writer.writeByte(2);
        break;
    }
  }
}
