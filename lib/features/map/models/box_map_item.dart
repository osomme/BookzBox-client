import 'package:bookzbox/features/box/box.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// Domain model representing a box that is shown on a map.
class BoxMapItem {
  /// The latitudinal position of the box.
  final double latitude;

  /// The longitudinal position of the box.
  final double longitude;

  /// The description of the box.
  final String description;

  /// The title of the box.
  final String title;

  /// The date and time that the box was published.
  final DateTime publishedOn;

  /// The ID of the publisher.
  final String publishedById;

  /// The ID of the box.
  final String boxId;

  /// A list of books that the box contains.
  final List<MapBookItem> books;

  /// The status of the box.
  final BoxStatus status;

  BoxMapItem({
    @required this.latitude,
    @required this.longitude,
    @required this.description,
    @required this.title,
    @required this.publishedOn,
    @required this.publishedById,
    @required this.boxId,
    @required this.books,
    @required this.status,
  });

  /// Maps a Firestore document into a [BoxMapItem] domain model.
  ///
  /// [doc] The Firestore document representing a single box map item.
  factory BoxMapItem.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return BoxMapItem(
      boxId: doc.documentID,
      publishedById: data['publisher'] as String,
      books: MapBookItem.fromFirebaseList(data['books']),
      publishedOn: DateTime.fromMillisecondsSinceEpoch((data['publishDateTime'] as int)),
      latitude: data['latitude'] as double,
      longitude: data['longitude'] as double,
      title: data['title'] as String,
      description: (data['description'] as String) ?? '',
      status: (data['status'] as int).toBoxStatus(),
    );
  }
}
