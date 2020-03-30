// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_feed_book.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BoxFeedBookAdapter extends TypeAdapter<BoxFeedBook> {
  @override
  final typeId = 1;

  @override
  BoxFeedBook read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BoxFeedBook(
      categories: (fields[0] as List)?.cast<String>(),
      thumbnailUrl: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BoxFeedBook obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.categories)
      ..writeByte(1)
      ..write(obj.thumbnailUrl);
  }
}
