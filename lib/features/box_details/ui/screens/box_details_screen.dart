import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/common/widgets/keys.dart';
import 'package:bookzbox/features/box/box.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:bookzbox/features/box_details/ui/widgets/widgets.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:bookzbox/features/location/location.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// Widget for the larger box details screen.
class BoxDetailsScreen extends StatefulWidget {
  /// The ID of the box that is being displayed.
  final String boxId;

  /// The user ID of the user that is viewing the box.
  final String userId;

  /// The box details store that is responsible for loading the box.
  final BoxDetailsStore store;

  /// The like store that is responsible for liking or removing likes for a box.
  final BoxLikeStore likeStore;

  /// Location service responsible for obtaining information about a location from its latitudinal and longitudinal coordinates.
  final ILocationService locationService;

  const BoxDetailsScreen({
    Key key,
    @required this.boxId,
    @required this.store,
    @required this.likeStore,
    @required this.locationService,
    @required this.userId,
  }) : super(key: key);

  @override
  _BoxDetailsScreenState createState() => _BoxDetailsScreenState();
}

class _BoxDetailsScreenState extends State<BoxDetailsScreen> {
  @override
  void dispose() {
    widget.likeStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.store.fetchBoxDetails(widget.boxId);
    return Scaffold(
      key: Key(Keys.boxDetailsScreenKey),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        body: Observer(
          builder: (ctx) {
            if (widget.store.isLoading) {
              return Center(
                child: SpinKitThreeBounce(
                  color: Theme.of(context).primaryColor,
                ),
              );
            } else if (widget.store.error != null) {
              return Center(
                child: Text(S.of(context).detailsFailedToLoadBox),
              );
            }

            return BoxDetails(
              box: widget.store.box,
              locationService: widget.locationService,
            );
          },
        ),
        headerSliverBuilder: (ctx, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 50.0,
              floating: true,
              pinned: false,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Padding(
                  padding: EdgeInsets.only(right: 90.0),
                  child: Observer(
                    builder: (ctx) {
                      var text = widget.store?.box?.title;
                      if (widget.store.isLoading) {
                        text = S.of(context).detailsLoading;
                      } else if (widget.store.error != null) {
                        text = S.of(context).detailsErrorAppBar;
                      }
                      return AutoSizeText(
                        text,
                        minFontSize: 10.0,
                        maxLines: 1,
                      );
                    },
                  ),
                ),
              ),
              actions: <Widget>[
                Observer(
                  builder: (_) {
                    /// A user is not allowed to like one of their own boxes or a box that is not public.
                    final idsAreNotNull =
                        widget.store.box?.publisher?.uid != null && widget.userId != null;
                    final userAndOwnerAreNotSame =
                        widget.userId != widget.store.box?.publisher?.uid;
                    final boxIsPublic = widget.store.box?.status == BoxStatus.public;
                    return idsAreNotNull && userAndOwnerAreNotSame && boxIsPublic
                        ? IconButton(
                            icon: Icon(widget.likeStore.isLiked
                                ? MaterialCommunityIcons.heart
                                : MaterialCommunityIcons.heart_outline),
                            onPressed: () => widget.likeStore.isLoading
                                ? null
                                : widget.likeStore.toggleLikeStatus(),
                          )
                        : SizedBox.shrink();
                  },
                ),
                Observer(
                  builder: (_) => widget.store.box?.publisher?.uid != null
                      ? IconButton(
                          icon: Icon(Icons.person),
                          onPressed: () => Navigator.pushNamed(
                            context,
                            Screens.profile,
                            arguments: widget.store.box.publisher.uid,
                          ),
                        )
                      : SizedBox.shrink(),
                ),
              ],
            ),
          ];
        },
      ),
    );
  }
}
