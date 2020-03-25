import 'package:bookzbox/features/box/box.dart';
import 'package:bookzbox/features/match/match.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TradeOffer {
  final String offerId;
  final DateTime timestamp;
  final String boxId;
  final String boxTitle;
  final String boxThumbnailUrl;
  final String offerByUserId;
  final String offerRecipientId;
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

  factory TradeOffer.fromFirebase(Map<dynamic, dynamic> data, String offerId) {
    return TradeOffer(
      offerId: offerId,
      timestamp: (data['timestamp'] as Timestamp).toDate(),
      boxId: data['boxId'],
      boxTitle: data['boxTitle'],
      boxThumbnailUrl: data['boxThumbnailUrl'],
      offerByUserId: data['offerByUserId'],
      offerRecipientId: data['offerRecipientId'],
      status: (data['status'] as int).toTradeOfferStatus(),
    );
  }
}
