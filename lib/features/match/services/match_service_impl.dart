import 'package:bookzbox/features/match/match.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FirebaseMatchServiceImpl implements IMatchService {
  final _firestore = Firestore.instance;

  @override
  Future<Stream<Match>> getMatchStream(String matchId) async {
    return _firestore.collection('matches').document(matchId).snapshots().map((snap) {
      if (!snap.exists) {
        return null;
      }
      return Match.fromFirestore(snap.data, snap.documentID);
    });
  }

  @override
  Future<Stream<List<TradeOffer>>> getTradeOfferStream(String matchId) async {
    return _firestore
        .collection('matches')
        .document(matchId)
        .collection('trade_offers')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snap) =>
            snap.documents.map((doc) => TradeOffer.fromFirebase(doc.data)).toList());
  }

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
        'status': offer.status,
        'timestamp': offer.timestamp,
      });
      return right(true);
    } catch (e) {
      print('Error while attempting to post a trade offer with'
          'match id: $matchId and data: $offer');
      return left(e.toString());
    }
  }
}
