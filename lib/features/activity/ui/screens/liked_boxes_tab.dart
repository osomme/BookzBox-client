import 'package:bookzbox/common/widgets/widgets.dart';
import 'package:bookzbox/features/activity/stores/my_liked_boxes_store.dart';
import 'package:bookzbox/features/profile/ui/widgets/my_box_list_item.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LikedBoxesTab extends StatelessWidget {
  /// Liked boxes store used to fetch data.
  final MyLikedBoxesStore likedBoxesStore;

  LikedBoxesTab({
    Key key,
    @required this.likedBoxesStore,

    /// The user ID of the user whose liked boxes are being shown.
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
              child: SpinKitThreeBounce(color: Theme.of(context).primaryColor),
            );
          } else if (likedBoxesStore.hasError) {
            return ErrorTextWithIcon(
              text: S.of(context).activityFailedBoxLoad,
              icon: Icon(
                Icons.error,
                color: Colors.grey,
                size: 64.0,
              ),
            );
          } else if (likedBoxesStore.boxes.isEmpty) {
            return ErrorTextWithIcon(
              text: S.of(context).activityNoLikedBoxes,
              icon: Icon(
                Entypo.box,
                color: Colors.grey,
                size: 64.0,
              ),
            );
          }

          return ListView.builder(
            itemCount: likedBoxesStore.boxes.length,
            itemBuilder: (ctx, i) {
              return MiniBoxListItem(
                box: likedBoxesStore.boxes[i],
                shouldShowLeftButton: true,
                leftButtonText: S.of(context).activityBoxFeedRemoveLike,
                onLeftButtonPressed: () =>
                    likedBoxesStore.removeLike(likedBoxesStore.boxes[i].id),
                shouldShowExtraOptions: false,
              );
            },
          );
        },
      ),
    );
  }
}
