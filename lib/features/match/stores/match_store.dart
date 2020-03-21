import 'dart:async';

import 'package:bookzbox/features/match/match.dart';
import 'package:mobx/mobx.dart';

part 'match_store.g.dart';

class MatchStore = _MatchStore with _$MatchStore;

abstract class _MatchStore with Store {
  final IMatchRepository _repository;

  StreamSubscription<Match> _matchSubscription;

  StreamSubscription<List<TradeOffer>> _tradeSubscription;

  @observable
  bool _isPostingTradeOffer = false;

  @observable
  bool _isMatchActive = false;

  @observable
  List<TradeOffer> _offers = List();

  _MatchStore(this._repository);

  @computed
  bool get isPostingTradeOffer => _isPostingTradeOffer;

  @computed
  bool get isMatchActive => _isMatchActive;

  @action
  void init(String matchId) {
    // Match stream
    _repository.getMatchStream(matchId).then((stream) =>
        _matchSubscription = stream.listen((match) => _isMatchActive = match.active));
    // Trade offers stream
    _repository.getTradeOfferStream(matchId).then(
        (stream) => _tradeSubscription = stream.listen((offers) => _offers = offers));
  }

  void dispose() {
    _matchSubscription?.cancel();
    _tradeSubscription?.cancel();
  }
}
