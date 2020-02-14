import 'dart:math';

import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/feed/stores/box_item_store.dart';
import 'package:bookzbox/features/location/services/location_service.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:bookzbox/common/extensions/extensions.dart';

class FeedListItem extends StatelessWidget {
  const FeedListItem({
    Key key,
    @required PageController pageController,
    @required this.index,
    @required this.box,
    @required this.store,
    @required this.locationService,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;
  final int index;
  final Box box;
  final BoxItemStore store;
  final ILocationService locationService;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, widget) {
        var value = 1.0;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - value.abs() * 0.3).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) *
                MediaQuery.of(context).size.height *
                0.85,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      animation: _pageController,
      child: GestureDetector(
        onTap: () => print('Box clicked'),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withAlpha(100),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _topTextRow(context),
                      SizedBox(height: 20.0),
                      _coverImages(),
                      SizedBox(height: 20.0),
                      _categoryAndTitleColumn(context),
                    ],
                  ),
                ),
              ),
            ),
            _likeButton(context),
          ],
        ),
      ),
    );
  }

  Row _topTextRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _locationColumn(context),
        _booksCountColumn(context),
      ],
    );
  }

  Column _booksCountColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          S.of(context).feedBooks,
          style:
              Theme.of(context).primaryTextTheme.subtitle.copyWith(color: Colors.white70),
        ),
        Text(
          '${box.books.length}',
          style: Theme.of(context).primaryTextTheme.subhead,
        ),
      ],
    );
  }

  Column _locationColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          S.of(context).feedLocation,
          style:
              Theme.of(context).primaryTextTheme.subtitle.copyWith(color: Colors.white70),
        ),
        _locationBuilder(),
      ],
    );
  }

  GridView _coverImages() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      padding: EdgeInsets.all(0.0),
      childAspectRatio: 0.75,
      children: _extractImages(4),
    );
  }

  List<CachedNetworkImage> _extractImages(int numImages) => box.books
      .take(numImages)
      .map(
        (b) => CachedNetworkImage(
          imageBuilder: (ctx, imageProvider) => Container(
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
          imageUrl: b.thumbnailUrl,
          placeholder: (ctx, url) => SpinKitPulse(
            size: 20.0,
            color: Theme.of(ctx).primaryIconTheme.color,
          ),
          errorWidget: (ctx, url, error) =>
              Image.asset('assets/images/book_cover_placeholder.jpeg'),
        ),
      )
      .toList();

  /*
      (b) => Image(
          height: 150.0,
          image: b.thumbnailUrl != null
              ? NetworkImage(b.thumbnailUrl)
              : AssetImage(
                  'assets/images/book_cover_placeholder.jpeg'), //TODO: Replace with better placeholder
          fit: BoxFit.fill,
        ),
      */

  Column _categoryAndTitleColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          box.books.toCategoryString(),
          style:
              Theme.of(context).primaryTextTheme.overline.copyWith(color: Colors.white70),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 5.0),
        Text(
          box.title,
          style: Theme.of(context).primaryTextTheme.subtitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 7.5),
      ],
    );
  }

  Positioned _likeButton(BuildContext context) {
    return Positioned(
      bottom: 10.0,
      child: RawMaterialButton(
        padding: EdgeInsets.all(15.0),
        shape: CircleBorder(),
        elevation: 2.0,
        fillColor: Theme.of(context).accentColor,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).accentColor,
                blurRadius: 12.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Observer(builder: (_) {
            if (store.isLoading) {
              return SpinKitPulse(
                size: 30.0,
                color: Theme.of(context).accentIconTheme.color,
              );
            }
            return Icon(
              store.isLiked
                  ? MaterialCommunityIcons.heart
                  : MaterialCommunityIcons.heart_outline,
              color: Theme.of(context).accentIconTheme.color,
              size: 30.0,
            );
          }),
        ),
        onPressed: () {
          if (store.isLoading) {
            return;
          }
          store.toggleLikeStatus();
        },
      ),
    );
  }

  FutureBuilder<Option<Placemark>> _locationBuilder() {
    return FutureBuilder<Option<Placemark>>(
      future: locationService.getLocationDataFrom(box.latitude, box.longitude),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return SpinKitPulse(
            size: 20.0,
            color: Theme.of(ctx).primaryIconTheme.color,
          );
        } else if (snapshot.hasError) {
          return Text(
            S.of(ctx).feedNoLocationData,
            style: Theme.of(ctx).primaryTextTheme.subhead,
          );
        }
        return Text(
          snapshot.data
              .map((p) => p.toLocationString())
              .filter((s) => s.isNotEmpty)
              .getOrElse(() => S.of(ctx).feedNoLocationData),
          style: Theme.of(ctx).primaryTextTheme.subhead,
        );
      },
    );
  }
}
