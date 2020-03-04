import 'package:bookzbox/features/activity/activity.dart';
import 'package:flutter/material.dart';

class ActivityFeedTab extends StatelessWidget {
  const ActivityFeedTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView.builder(
        itemCount: testActivityFeedItems.length,
        itemBuilder: (ctx, i) => testActivityFeedItems[i].toListItem(context),
      ),
    );
  }
}
