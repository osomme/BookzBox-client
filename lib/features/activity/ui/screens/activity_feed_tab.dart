import 'package:bookzbox/common/widgets/widgets.dart';
import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ActivityFeedTab extends StatelessWidget {
  final ActivityFeedStore activityFeedStore;

  const ActivityFeedTab({
    Key key,
    @required this.activityFeedStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Observer(
        builder: (_) {
          if (activityFeedStore.hasError) {
            return ErrorTextWithIcon(
              text: S.of(context).activityFailedBoxLoad,
              icon: Icon(
                Icons.error,
                color: Colors.grey,
                size: 64.0,
              ),
            );
          }
          if (activityFeedStore.feedItems.isEmpty) {
            return ErrorTextWithIcon(
              text: S.of(context).activityNoFeedItems,
              icon: Icon(
                FontAwesome5Solid.bell_slash,
                color: Colors.grey,
                size: 64.0,
              ),
            );
          }
          return ListView.builder(
            itemCount: activityFeedStore.feedItems.length,
            itemBuilder: (ctx, i) => activityFeedStore.feedItems[i].toListItem(context),
          );
        },
      ),
    );
  }
}
