import 'package:bookzbox/features/match/match.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TradeOffer {
  final DateTime timestamp;
  final String boxId;
  final String boxTitle;
  final String boxThumbnailUrl;
  final String offerByUserId;
  final String offerRecipientId;
  final TradeOfferStatus status;

  TradeOffer({
    @required this.timestamp,
    @required this.boxId,
    @required this.boxTitle,
    @required this.boxThumbnailUrl,
    @required this.offerByUserId,
    @required this.status,
    @required this.offerRecipientId,
  });

  factory TradeOffer.fromFirebase(Map<dynamic, dynamic> data) {
    return TradeOffer(
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
