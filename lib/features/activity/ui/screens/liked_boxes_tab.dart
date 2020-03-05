import 'package:bookzbox/features/activity/stores/my_liked_boxes_store.dart';
import 'package:bookzbox/features/profile/ui/widgets/my_box_list_item.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LikedBoxesTab extends StatelessWidget {
  final MyLikedBoxesStore likedBoxesStore;

  LikedBoxesTab({
    Key key,
    @required this.likedBoxesStore,
    @required String userId,
  }) : super(key: key) {
    likedBoxesStore.fetchBoxes(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Observer(
        builder: (_) {
          if (likedBoxesStore.isLoading) {
            return Center(
              child: SpinKitThreeBounce(
                color: Theme.of(context).primaryColor,
              ),
            );
          }

          if (likedBoxesStore.hasError) {
            return Center(
              child: Text(S.of(context).activityFailedBoxLoad),
            );
          }

          return ListView.builder(
            itemCount: likedBoxesStore.boxes.length,
            itemBuilder: (ctx, i) {
              return MiniBoxListItem(
                box: likedBoxesStore.boxes[i],
                shouldShowLeftButton: true,
                leftButtonText: S.of(context).activityBoxFeedRemoveLike,
                onLeftButtonPressed: () => print('Clicked remove like'),
              );
            },
          );
        },
      ),
    );
  }
}
