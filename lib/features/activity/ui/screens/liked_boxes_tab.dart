import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/profile/ui/widgets/my_box_list_item.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';

class LikedBoxesTab extends StatelessWidget {
  const LikedBoxesTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (ctx, i) {
          return MiniBoxListItem(
            box: _testBoxes[i],
            shouldShowLeftButton: true,
            leftButtonText: S.of(context).activityBoxFeedRemoveLike,
            onLeftButtonPressed: () => print('Clicked remove like'),
          );
        },
      ),
    );
  }
}

final _testBoxes = [
  MiniBox(
    id: 'fewafwaef',
    status: BoxStatus.public,
    publishDateTime: DateTime.now().subtract(Duration(days: 2)),
    title: 'Test box 1',
    bookThumbnailUrl: null,
  ),
  MiniBox(
    id: 'wefwaef',
    status: BoxStatus.private,
    publishDateTime: DateTime.now().subtract(Duration(days: 1)),
    title: 'Test box 2',
    bookThumbnailUrl: null,
  ),
  MiniBox(
    id: 'awrwar',
    status: BoxStatus.traded,
    publishDateTime: DateTime.now().subtract(Duration(minutes: 2)),
    title: 'Test box 3',
    bookThumbnailUrl: null,
  ),
];
