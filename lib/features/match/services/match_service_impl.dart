import 'package:bookzbox/features/match/match.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

/// Class which enables the use of Firebase Firestore through the [IMatchService] interface.
class FirebaseMatchServiceImpl implements IMatchService {
  final _firestore = Firestore.instance;

  /// Retrieves a match stream from Firestore.
  /// [matchId] is the matchId that that the stream belongs to.
  @override
  Future<Stream<Match>> getMatchStream(String matchId) async {
    return _firestore.collection('matches').document(matchId).snapshots().map((snap) {
      if (!snap.exists) {
        return null;
      }
      return Match.fromFirestore(snap.data, snap.documentID);
    });
  }

  /// Retrives a stream of trade offers.
  /// [matchId] is the ID of the match that the stream belongs to.
  @override
  Future<Stream<List<TradeOffer>>> getTradeOfferStream(String matchId) async {
    return _firestore
        .collection('matches')
        .document(matchId)
        .collection('trade_offers')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snap) => snap.documents
            .map((doc) => TradeOffer.fromFirebase(doc.data, doc.documentID))
            .toList());
  }

  /// Posts a trade offer to Firestore.
  /// [matchId] is the ID of the match that the offer is being posted to.
  /// [offer] is the actual offer that is being uploaded.
  @override
  Future<Either<String, bool>> postTradeOffer(String matchId, TradeOffer offer) async {
    try {
      await _firestore
          .collection('matches')
          .document(matchId)
          .collection('trade_offers')
          .add({
        'boxId': offer.boxId,
        'boxTitle': offer.boxTitle,
        'boxThumbnailUrl': offer.boxThumbnailUrl,
        'offerByUserId': offer.offerByUserId,
        'offerRecipientId': offer.offerRecipientId,
        'status': offer.status.index,
        'timestamp': FieldValue.serverTimestamp(),
      });
      return right(true);
    } catch (e) {
      print('Error while attempting to post a trade offer with '
          'match id: $matchId and data: $offer');
      return left(e.toString());
    }
  }

  /// Marks a trade offer as accepted in the Firestore database.
  /// [matchId] is the ID of the match that the offer belongs to.
  /// [offer] is the offer that the user is accepting.
  @override
  Future<Either<String, bool>> acceptTradeOffer(String matchId, TradeOffer offer) =>
      _setOfferStatus(matchId, offer.offerId, TradeOfferStatus.Accepted);

  /// Marks a trade offer as rejected in the Firestore database.
  /// [matchId] is the ID of the match that the offer belongs to.
  /// [offer] is the offer that the user is rejecting.
  @override
  Future<Either<String, bool>> rejectTradeOffer(String matchId, TradeOffer offer) =>
      _setOfferStatus(matchId, offer.offerId, TradeOfferStatus.Rejected);

  /// Helper function to set offer status.
  Future<Either<String, bool>> _setOfferStatus(
    String matchId,
    String offerId,
    TradeOfferStatus status,
  ) async {
    try {
      await _firestore
          .collection('matches')
          .document(matchId)
          .collection('trade_offers')
          .document(offerId)
          .setData({'status': status.index}, merge: true);
      return right(true);
    } catch (e) {
      print('Failed to update offer status with match '
          'ID: $matchId and offer ID: $offerId with status: $status');
      return left(e.toString());
    }
  }
}
