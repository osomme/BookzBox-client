import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';

extension TradeEventExtension on String {
  TradeEvent toTradeEvent() {
    switch (this) {
      case 'accepted':
        return TradeEvent.Accepted;
      case 'rejected':
        return TradeEvent.Rejected;
      case 'new':
        return TradeEvent.New;
      default:
        return TradeEvent.Unknown;
    }
  }
}

extension TradeEventLocalization on TradeEvent {
  String toLocalizedActivityString(BuildContext ctx) {
    switch (this) {
      case TradeEvent.Accepted:
        return S.of(ctx).activityItemAcceptedTrade;
      case TradeEvent.Rejected:
        return S.of(ctx).activityItemRejectedTrade;
      case TradeEvent.New:
        return S.of(ctx).activityitemNewTradeOffer;
      default:
        return S.of(ctx).activityItemUnknownTradeType;
    }
  }
}
