import 'package:bookzbox/features/map/box_map.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BookCoverList extends StatelessWidget {
  final BoxMapItem box;

  final double height;
  final double width;

  const BookCoverList({
    Key key,
    @required this.box,
    this.height = 150.0,
    this.width = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return box.books.any((b) => b.thumbnailUrl != null)
        ? _imageList(context)
        : _noImagesText(context);
  }

  Padding _imageList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 175.0,
        child: Center(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: box.books.length,
            itemBuilder: (ctx, i) {
              return Row(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      _imageWidget(i),
                      SizedBox(height: 2.0),
                      _imageText(i, context),
                    ],
                  ),
                  (i + 1) < box.books.length ? SizedBox(width: 5.0) : SizedBox.shrink(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Container _noImagesText(BuildContext context) {
    return Container(
      child: Text(
        S.of(context).mapNoImages,
        style: Theme.of(context).primaryTextTheme.body2,
      ),
    );
  }

  Text _imageText(int index, BuildContext context) {
    return Text(
      box.books[index].categories.first ?? '',
      style: Theme.of(context).primaryTextTheme.caption,
    );
  }

  Container _imageWidget(int index) {
    return Container(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageBuilder: (ctx, imageProvider) => Container(
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
        ),
        imageUrl: box.books[index].thumbnailUrl ?? '',
        placeholder: (ctx, url) => SpinKitPulse(
          size: 20.0,
          color: Theme.of(ctx).primaryIconTheme.color,
        ),
        errorWidget: (ctx, url, error) => Image.asset(
            'assets/images/book_cover_placeholder.jpeg'), //TODO: Replace with better placeholder?
      ),
    );
  }
}
