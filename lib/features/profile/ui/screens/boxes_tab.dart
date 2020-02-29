import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/new_box/ui/screens/new_box_screen.dart';
import 'package:bookzbox/features/profile/stores/profile_store.dart';
import 'package:bookzbox/features/profile/ui/widgets/my_box_list_item.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

/// Represents the my boxes tab on the profile page
class BoxesTab extends StatelessWidget {
  final ProfileStore store;

  BoxesTab({
    Key key,
    @required this.store,
  }) : super(key: key);

  void changeVisibilityAndCloseDialog(BuildContext ctx) {
    // TODO: change visibility
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 70.0),
          itemCount: store.myBoxes.length,
          itemBuilder: (BuildContext context, int index) {
            return MyBoxListItem(
              onChangeVisibilityPressed: () => showDialog<void>(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
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
                            groupValue: store.currentBoxStatus,
                            onChanged: (BoxStatus value) => store.setCurrentBoxStatus(value),
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
                            groupValue: store.currentBoxStatus,
                            onChanged: (BoxStatus value) => store.setCurrentBoxStatus(value),
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
                              style: TextStyle(
                                  color: Colors.deepPurple[900], fontWeight: FontWeight.w700),
                            ),
                            onPressed: () => changeVisibilityAndCloseDialog(context),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              box: store.myBoxes[index],
              isMyBox: store.isMyProfile,
            );
          }),
      floatingActionButton: (store.isMyProfile
          ? FloatingActionButton.extended(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => Provider.of<NewBoxScreen>(ctx))),
              label: Text(
                S.of(context).profileNewBoxFAB,
              ),
              icon: Icon(
                FontAwesome5Solid.box_open,
                size: 20,
              ),
            )
          : null),
    );
  }
}
