import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:bookzbox/features/box_details/ui/widgets/widgets.dart';
import 'package:bookzbox/features/feed/stores/box_like_store.dart';
import 'package:bookzbox/features/location/location.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BoxDetailsScreen extends StatefulWidget {
  final String boxId;
  final BoxDetailsStore store;
  final BoxLikeStore likeStore;
  final ILocationService locationService;

  const BoxDetailsScreen({
    Key key,
    @required this.boxId,
    @required this.store,
    @required this.likeStore,
    @required this.locationService,
  }) : super(key: key);

  @override
  _BoxDetailsScreenState createState() {
    store.fetchBoxDetails(boxId);
    return _BoxDetailsScreenState();
  }
}

class _BoxDetailsScreenState extends State<BoxDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  builder: (_) => IconButton(
                    icon: Icon(widget.likeStore.isLiked
                        ? MaterialCommunityIcons.heart
                        : MaterialCommunityIcons.heart_outline),
                    onPressed: () =>
                        widget.likeStore.isLoading ? null : widget.likeStore.toggleLikeStatus(),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () => Navigator.pushNamed(
                    context,
                    Screens.profile,
                    arguments: widget.store.box.publisher.uid,
                  ),
                ),
              ],
            ),
          ];
        },
      ),
    );
  }
}
