import 'package:bookzbox/features/match/match.dart';

extension TradeOfferMapper on int {
  /// Maps an integer to a [TradeOfferStatus] enum value. Throws an exception if the integer is not in valid range.
  TradeOfferStatus toTradeOfferStatus() {
    switch (this) {
      case 0:
        return TradeOfferStatus.Accepted;
      case 1:
        return TradeOfferStatus.Rejected;
      case 2:
        return TradeOfferStatus.Waiting;
      default:
        throw 'Unknown trade offer status. Value was: $this, but must be in range [0-2]';
    }
  }
}
