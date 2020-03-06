import 'package:bookzbox/common/widgets/widgets.dart';
import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/new_box/ui/screens/new_box_screen.dart';
import 'package:bookzbox/features/profile/stores/profile_box_store.dart';
import 'package:bookzbox/features/profile/stores/profile_store.dart';
import 'package:bookzbox/features/profile/ui/widgets/my_box_list_item.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

/// Represents the my boxes tab on the profile page
class BoxesTab extends StatelessWidget {
  final ProfileStore profileStore;
  final ProfileBoxStore boxStore;

  BoxesTab({
    Key key,
    @required this.profileStore,
    @required this.boxStore,
  }) : super(key: key);

  Future changeVisibilityAndCloseDialog(BuildContext ctx) async {
    Navigator.of(ctx).pop();
    await boxStore.updateBoxVisibility();
  }

  AlertDialog genBoxVisibilityDialog(BuildContext context, MiniBox box, int index) {
    boxStore.setIsFirstVisibilityChange(true);
    boxStore.setStartBoxStatus(box.status);
    boxStore.setCurrentBoxStatus(box.status);
    boxStore.setCurrentBox(box);

    return AlertDialog(
      title: Text(S.of(context).boxVisibilityChangeDialogTitle),
      contentPadding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 12.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Observer(
            builder: (_) => RadioListTile(
              title: Text(S.of(context).boxStatusPublic),
              subtitle: Text(
                S.of(context).boxStatusPublicDesc,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              value: BoxStatus.public,
              groupValue: boxStore.currentBoxStatus,
              onChanged: (BoxStatus value) {
                boxStore.setCurrentBoxStatus(value);
                boxStore.setCurrentBox(box);
              },
              activeColor: Colors.deepPurple[900],
            ),
          ),
          Observer(
            builder: (_) => RadioListTile(
              title: Text(S.of(context).boxStatusPrivate),
              value: BoxStatus.private,
              subtitle: Text(
                S.of(context).boxStatusPrivateDesc,
                style: TextStyle(color: Colors.black),
              ),
              groupValue: boxStore.currentBoxStatus,
              onChanged: (BoxStatus value) => boxStore.setCurrentBoxStatus(value),
              activeColor: Colors.deepPurple[900],
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
              child: Text(
                S.of(context).boxCancelVisibilityChange,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text(
                S.of(context).boxConfirmVisibilityChange,
                style:
                    TextStyle(color: Colors.deepPurple[900], fontWeight: FontWeight.w700),
              ),
              onPressed: () => changeVisibilityAndCloseDialog(context),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Observer(
          builder: (_) => (boxStore.isLoading
              ? Center(
                  child: SpinKitThreeBounce(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : (boxStore.myBoxes.length > 0
                  ? ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 70.0),
                      itemCount: boxStore.myBoxes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Observer(
                            builder: (_) => MiniBoxListItem(
                                  leftButtonText:
                                      S.of(context).profileChangeVisibilityBtn,
                                  onLeftButtonPressed: () => showDialog<void>(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) {
                                      return genBoxVisibilityDialog(
                                          context, boxStore.myBoxes[index], index);
                                    },
                                  ),
                                  box: boxStore.myBoxes[index],
                                  shouldShowLeftButton: profileStore.isMyProfile,
                                ));
                      })
                  : ErrorTextWithIcon(
                      icon: Icon(
                        Entypo.emoji_sad,
                        size: 64,
                        color: Colors.grey,
                      ),
                      text: S.of(context).profileNoBoxes,
                    ))),
        ),
        floatingActionButton: (profileStore.isMyProfile
            ? FloatingActionButton.extended(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => Provider.of<NewBoxScreen>(ctx))),
                label: Text(
                  S.of(context).profileNewBoxFAB,
                ),
                icon: Icon(
                  FontAwesome5Solid.box_open,
                  size: 20,
                ),
              )
            : null));
  }
}
