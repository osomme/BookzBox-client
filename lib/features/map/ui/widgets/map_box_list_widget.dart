import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:bookzbox/features/map/models/box_map_item.dart';
import 'package:bookzbox/common/extensions/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MapBoxList extends StatelessWidget {
  final List<BoxMapItem> boxes;

  MapBoxList({@required this.boxes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: boxes.length,
      itemBuilder: (ctx, i) {
        final box = boxes[i];
        if (i == 0) {
          return Column(
            children: <Widget>[
              _headerAndFirstBox(context),
              _ListItem(
                box: box,
                listLength: boxes.length,
                index: i,
              ),
            ],
          );
        }
        return _ListItem(
          box: box,
          listLength: boxes.length,
          index: i,
        );
      },
    );
  }

  Widget _headerAndFirstBox(BuildContext context) {
    return Container(
      height: 50.0,
      color: Theme.of(context).accentColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '${boxes.length}',
            style: Theme.of(context).accentTextTheme.title,
          ),
          SizedBox(width: 6.0),
          Icon(FontAwesome5Solid.box_open),
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key key,
    @required this.box,
    @required this.listLength,
    @required this.index,
  }) : super(key: key);

  final BoxMapItem box;
  final int listLength;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 150.0,
          color: Theme.of(context).primaryColor,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            box.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .title
                                .copyWith(fontSize: 14.0),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            box.description,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .caption
                                .copyWith(fontSize: 12.0),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                color: Theme.of(context).primaryIconTheme.color,
                                size: 16.0,
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                box.publishedOn.toTimeDifferenceString(context),
                                style: Theme.of(context).primaryTextTheme.body1,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Entypo.open_book,
                                color: Theme.of(context).primaryIconTheme.color,
                                size: 16.0,
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                '${box.books.length}',
                                style: Theme.of(context).primaryTextTheme.body1,
                              ),
                            ],
                          ),
                          FlatButton(
                            onPressed: () => Navigator.pushNamed(
                                context, Screens.boxDetails,
                                arguments: box.boxId),
                            child: Text(
                              'Details',
                              style: TextStyle(color: Colors.purple[200]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CachedNetworkImage(
                    imageBuilder: (ctx, imageProvider) => Container(
                      height: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    imageUrl: box.books.first.thumbnailUrl ?? '',
                    placeholder: (ctx, url) => SpinKitPulse(
                      size: 20.0,
                      color: Theme.of(ctx).primaryIconTheme.color,
                    ),
                    errorWidget: (ctx, url, error) => Image.asset(
                        'assets/images/book_cover_placeholder.jpeg'), //TODO: Replace with better placeholder?
                  ),
                ),
              ],
            ),
          ),
        ),
        (index != listLength - 1)
            ? Divider(
                color: Theme.of(context).accentColor,
                height: 0.0,
                thickness: 1.0,
              )
            : SizedBox.shrink(),
      ],
    );
  }
}