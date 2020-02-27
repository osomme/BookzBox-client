import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:bookzbox/features/box_details/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BoxDetailsScreen extends StatefulWidget {
  final String boxId;
  final BoxDetailsStore store;

  const BoxDetailsScreen({
    Key key,
    @required this.boxId,
    @required this.store,
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
                //TODO: Replace with localized error text
                child: Text('Failed to load box'),
              );
            }

            return BoxDetails(box: widget.store.box);
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
                      if (widget.store.isLoading) {
                        return Text('Loading...');
                      } else if (widget.store.error != null) {
                        return Text('Error');
                      }
                      return AutoSizeText(
                        widget.store.box.title,
                        minFontSize: 10.0,
                        maxLines: 1,
                      );
                    },
                  ),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () => print('Go to user profile clicked'),
                ),
                IconButton(
                  icon: Icon(MaterialCommunityIcons.heart),
                  onPressed: () => print('Add box to favorites clicked'),
                ),
              ],
            ),
          ];
        },
      ),
    );
  }
}
