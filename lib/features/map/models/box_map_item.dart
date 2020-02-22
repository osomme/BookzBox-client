import 'package:bookzbox/features/map/box_map.dart';
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

  BoxMapItem({
    @required this.latitude,
    @required this.longitude,
    @required this.description,
    @required this.title,
    @required this.publishedOn,
    @required this.publishedById,
    @required this.boxId,
    @required this.books,
  });
}
