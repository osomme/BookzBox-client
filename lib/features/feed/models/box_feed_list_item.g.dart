// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_feed_list_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BoxFeedListItemAdapter extends TypeAdapter<BoxFeedListItem> {
  @override
  final typeId = 0;

  @override
  BoxFeedListItem read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BoxFeedListItem(
      id: fields[0] as String,
      publisherId: fields[1] as String,
      publishedOn: fields[2] as DateTime,
      title: fields[3] as String,
      description: fields[4] as String,
      lat: fields[5] as double,
      lng: fields[6] as double,
      books: (fields[7] as List)?.cast<BoxFeedBook>(),
      status: fields[8] as BoxStatus,
    );
  }

  @override
  void write(BinaryWriter writer, BoxFeedListItem obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.publisherId)
      ..writeByte(2)
      ..write(obj.publishedOn)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.lat)
      ..writeByte(6)
      ..write(obj.lng)
      ..writeByte(7)
      ..write(obj.books)
      ..writeByte(8)
      ..write(obj.status);
  }
}
