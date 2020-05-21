import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/box/helpers/status_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'box_feed_list_item.g.dart';

/// A minimized version of a `Box` designed for the feed.
@HiveType(typeId: 0)
class BoxFeedListItem extends HiveObject {
  /// The ID of the box.
  @HiveField(0)
  final String id;

  /// The ID of the publisher of the box.
  @HiveField(1)
  final String publisherId;

  /// The date that the box was published.
  @HiveField(2)
  final DateTime publishedOn;

  /// The title of the box.
  @HiveField(3)
  final String title;

  /// The description of the box.
  @HiveField(4)
  final String description;

  /// Latitudinal coordinates of the box.
  @HiveField(5)
  final double lat;

  /// Longitudinal coordinates of the box.
  @HiveField(6)
  final double lng;

  /// A list of [BoxFeedBook]s belonging to the box.
  @HiveField(7)
  final List<BoxFeedBook> books;

  /// The current [BoxStatus] value of the box.
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

  /// Maps a JSON map into [BoxFeedListItem].
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
