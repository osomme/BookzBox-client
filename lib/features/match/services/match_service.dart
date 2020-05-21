import 'package:bookzbox/features/match/match.dart';
import 'package:dartz/dartz.dart';

/// Service which provides methods for interacting with matches and trade offers.
abstract class IMatchService {
  /// Posts a trade offer.
  ///
  /// [matchId] The ID of the match that the offer is being posted to.
  /// [offer] The offer that is being posted.
  Future<Either<String, bool>> postTradeOffer(String matchId, TradeOffer offer);

  /// Accepts a trade offer.
  ///
  /// [matchId] The ID of the match where the offer is being accepted.
  /// [offer] The offer that is being accepted.
  Future<Either<String, bool>> acceptTradeOffer(String matchId, TradeOffer offer);

  /// Rejects a trade offer.
  ///
  /// [matchId] The ID of the match where the offer is being rejected.
  /// [offer] The offer that is being rejected.
  Future<Either<String, bool>> rejectTradeOffer(String matchId, TradeOffer offer);

  /// Retrieves a stream of trade offers.
  ///
  /// [matchId] The match that the trade offers belong to.
  Future<Stream<List<TradeOffer>>> getTradeOfferStream(String matchId);

  /// Retrieves a stream of a single match.
  ///
  /// [matchId] The ID of the mathc that is being streamed.
  Future<Stream<Match>> getMatchStream(String matchId);
}
