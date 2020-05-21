import 'package:bookzbox/features/box/box.dart';
import 'package:bookzbox/features/match/match.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// Domain model class representing a trade offer.
class TradeOffer {
  /// The ID of the offer.
  final String offerId;

  /// The timestamp for when the offer was made.
  final DateTime timestamp;

  /// The ID of the box that is being offered.
  final String boxId;

  /// The title of the box that is being offered.
  final String boxTitle;

  /// An URL pointing to a cover image of the box that is being offered.
  final String boxThumbnailUrl;

  /// The ID of the user that is sending the offer.
  final String offerByUserId;

  /// The ID of the user that is receiving the offer.k
  final String offerRecipientId;

  /// Status of the offer.
  final TradeOfferStatus status;

  TradeOffer({
    this.offerId,
    @required this.timestamp,
    @required this.boxId,
    @required this.boxTitle,
    @required this.boxThumbnailUrl,
    @required this.offerByUserId,
    @required this.status,
    @required this.offerRecipientId,
  });

  /// Maps a trade offer from a [MiniBox].
  ///
  /// [box] The box that is being offered.
  /// [offerByUserId] The ID of the user that is making the offer.
  /// [offerRecipientId] The ID of the user that is receiving the offer.
  factory TradeOffer.fromMiniBox(
      MiniBox box, String offerByUserId, String offerRecipientId) {
    return TradeOffer(
      timestamp: DateTime.now(),
      boxId: box.id,
      boxTitle: box.title,
      boxThumbnailUrl: box.bookThumbnailUrl,
      offerByUserId: offerByUserId,
      status: TradeOfferStatus.Waiting,
      offerRecipientId: offerRecipientId,
    );
  }

  /// Maps a trade offer from a Firestore document.
  ///
  /// [data] The Firestore document representing a trade offer.
  /// [offerId] The ID of the offer.
  factory TradeOffer.fromFirebase(Map<dynamic, dynamic> data, String offerId) {
    return TradeOffer(
      offerId: offerId,
      timestamp: (data['timestamp'] as Timestamp)?.toDate() ?? DateTime.now(),
      boxId: data['boxId'],
      boxTitle: data['boxTitle'],
      boxThumbnailUrl: data['boxThumbnailUrl'],
      offerByUserId: data['offerByUserId'],
      offerRecipientId: data['offerRecipientId'],
      status: (data['status'] as int).toTradeOfferStatus(),
    );
  }
}
