import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/box/helpers/status_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BoxFeedListItem {
  final String id;
  final String publisherId;
  final DateTime publishedOn;
  final String title;
  final String description;
  final double lat;
  final double lng;
  final List<BoxFeedBook> books;
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
}
