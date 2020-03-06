import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
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
            return Center(child: Text(S.of(context).activityFeedErrorMessage));
          }
          return activityFeedStore.feedItems.length > 0
              ? ListView.builder(
                  itemCount: activityFeedStore.feedItems.length,
                  itemBuilder: (ctx, i) =>
                      activityFeedStore.feedItems[i].toListItem(context),
                )
              : Center(child: Text(S.of(context).activityNoFeedItems));
        },
      ),
    );
  }
}
