import 'package:bookzbox/features/match/match.dart';
import 'package:dartz/dartz.dart';

abstract class IMatchService {
  Future<Either<String, bool>> postTradeOffer(String matchId, TradeOffer offer);

  Future<Stream<List<TradeOffer>>> getTradeOfferStream(String matchId);

  Future<Stream<Match>> getMatchStream(String matchId);
}
