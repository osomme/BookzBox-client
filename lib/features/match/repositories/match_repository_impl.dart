import 'package:bookzbox/features/match/match.dart';
import 'package:dartz/dartz.dart';

class MatchRepositoryImpl implements IMatchRepository {
  final IMatchService _service;

  MatchRepositoryImpl(this._service);

  @override
  Future<Stream<Match>> getMatchStream(String matchId) =>
      _service.getMatchStream(matchId);

  @override
  Future<Stream<List<TradeOffer>>> getTradeOfferStream(String matchId) =>
      _service.getTradeOfferStream(matchId);

  @override
  Future<Either<String, bool>> postTradeOffer(String matchId, TradeOffer offer) =>
      _service.postTradeOffer(matchId, offer);

  @override
  Future<Either<String, bool>> acceptTradeOffer(String matchId, TradeOffer offer) =>
      _service.acceptTradeOffer(matchId, offer);

  @override
  Future<Either<String, bool>> rejectTradeOffer(String matchId, TradeOffer offer) =>
      _service.rejectTradeOffer(matchId, offer);
}
