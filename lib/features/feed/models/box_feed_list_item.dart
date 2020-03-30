import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/box/helpers/status_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'box_feed_list_item.g.dart';

@HiveType(typeId: 0)
class BoxFeedListItem extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String publisherId;

  @HiveField(2)
  final DateTime publishedOn;

  @HiveField(3)
  final String title;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final double lat;

  @HiveField(6)
  final double lng;

  @HiveField(7)
  final List<BoxFeedBook> books;

  @HiveField(8)
  final BoxStatus status;

  BoxFeedListItem({
    @required this.id,
    @required this.publisherId,
    @required this.publishedOn,
    @required this.title,
    @required this.description,
    @required this.lat,
    @required this.lng,
    @required this.books,
    @required this.status,
  });

  @override
  bool operator ==(Object other) => other is BoxFeedListItem && other.id == id;

  @override
  int get hashCode => id.hashCode;

  factory BoxFeedListItem.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return BoxFeedListItem(
      id: doc.documentID,
      publisherId: data['publisher'] as String,
      books: BoxFeedBook.fromFirebaseList(data['books']),
      publishedOn: DateTime.fromMillisecondsSinceEpoch((data['publishDateTime'] as int)),
      lat: data['latitude'] as double,
      lng: data['longitude'] as double,
      title: data['title'] as String,
      description: (data['description'] as String) ?? '',
      status: (data['status'] as int).toBoxStatus(),
    );
  }

  factory BoxFeedListItem.fromJson(Map<String, dynamic> json) {
    return BoxFeedListItem(
      id: json['id'],
      publisherId: json['publisher'],
      publishedOn: DateTime.fromMillisecondsSinceEpoch((json['publishDateTime'] as int)),
      title: json['title'] as String,
      description: (json['description'] as String) ?? '',
      lat: json['latitude'] as double,
      lng: json['longitude'] as double,
      books: BoxFeedBook.fromFirebaseList(json['books']),
      status: (json['status'] as int).toBoxStatus(),
    );
  }
}
