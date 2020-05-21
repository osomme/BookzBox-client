import 'dart:convert';

import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/feed/models/box_feed_list_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

/// Firebase inplementation of the [IFeedService] interface.
class FirebaseFeedService implements IFeedService {
  final _firestore = Firestore.instance;
  final String _recommenderApiUrl = 'http://13.48.105.244:80/api/';

  /// Retrieves a collection of [BoxFeedListItem] from the reccomendation system.
  @override
  Future<Either<NetworkError, List<BoxFeedListItem>>> getBoxRecommendations(
      String userId, int limit,
      {double latitude = -1.0, double longitude = -1.0}) async {
    var res = await http.get(_recommenderApiUrl +
        "recommendations?userId=" +
        userId +
        "&limit=" +
        limit.toString() +
        "&latitude=" +
        latitude.toString() +
        "&longitude=" +
        longitude.toString());

    if (res.statusCode != 200) {
      return left(NetworkError.noInternet);
    }

    final json = jsonDecode(res.body);
    List<BoxFeedListItem> boxes = new List();
    for (final jsonItem in json) {
      boxes.add(BoxFeedListItem.fromJson(jsonItem));
    }

    return right(boxes);
  }
}
