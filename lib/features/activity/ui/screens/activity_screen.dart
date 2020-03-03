import 'package:bookzbox/features/activity/activity.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recent activity'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: ListView.builder(
          itemCount: testActivityFeedItems.length,
          itemBuilder: (ctx, i) => testActivityFeedItems[i].toListItem(context),
        ),
      ),
    );
  }
}
