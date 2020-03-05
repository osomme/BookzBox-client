import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/new_box/ui/screens/new_box_screen.dart';
import 'package:bookzbox/features/profile/stores/profile_store.dart';
import 'package:bookzbox/features/profile/ui/widgets/activity_status_card.dart';
import 'package:bookzbox/features/profile/ui/widgets/rating_card.dart';
import 'package:bookzbox/features/profile/ui/widgets/stats_card.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

/// Represents the me tab on the profile page
class MeTab extends StatelessWidget {
  final ProfileStore profileStore;
  final AuthStore authStore;

  MeTab({Key key, @required this.profileStore, this.authStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Observer(
                builder: (_) {
                  return ActivityStatusCard(
                    lastSeen: profileStore.profile.lastSeen,
                  );
                },
              ),
              Observer(builder: (_) {
                return RatingCard(
                  rating: profileStore.profile.rating,
                );
              }),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Observer(builder: (_) {
                      return StatsCard(
                        title: S.of(context).profileTradesTitle,
                        stat: profileStore.profile.tradeCount.toString(),
                      );
                    }),
                  ),
                  Expanded(
                    child: Observer(builder: (_) {
                      return StatsCard(
                        title: S.of(context).profileJoinDateTitle,
                        stat: profileStore.profile.joinDate.year.toString(),
                      );
                    }),
                  ),
                ],
              ),
              (profileStore.isMyProfile
                  ? Container(
                      height: 128,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.all(2.0),
                              child: MaterialButton(
                                color: Theme.of(context).primaryColor,
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => Provider.of<NewBoxScreen>(ctx))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: 12),
                                      child: Icon(
                                        FontAwesome5Solid.box_open,
                                        size: 20,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                    Text(
                                      S.of(context).profileNewBoxTitle,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context).accentColor),
                                    ),
                                  ],
                                ),
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  side: BorderSide(
                                    width: 2.0,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 10,
                      width: 10,
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
