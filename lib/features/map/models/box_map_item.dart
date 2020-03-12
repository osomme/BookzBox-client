import 'package:bookzbox/features/box/box.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BoxMapItem {
  final double latitude;
  final double longitude;
  final String description;
  final String title;
  final DateTime publishedOn;
  final String publishedById;
  final String boxId;
  final List<MapBookItem> books;
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

  factory BoxMapItem.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return BoxMapItem(
      boxId: doc.documentID,
      publishedById: data['publisher'] as String,
      books: MapBookItem.fromFirebaseList(data['books']),
      publishedOn: (data['publishDateTime'] as Timestamp).toDate(),
      latitude: data['latitude'] as double,
      longitude: data['longitude'] as double,
      title: data['title'] as String,
      description: (data['description'] as String) ?? '',
      status: (data['status'] as int).toBoxStatus(),
    );
  }
}
