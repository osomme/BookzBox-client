import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:bookzbox/features/location/services/location_service.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart' as Dartz;
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:bookzbox/common/extensions/extensions.dart';

class FeedListItem extends StatefulWidget {
  const FeedListItem({
    Key key,
    @required this.pageController,
    @required this.index,
    @required this.box,
    @required this.store,
    @required this.locationService,
  }) : super(key: key);

  final PageController pageController;
  final int index;
  final BoxFeedListItem box;
  final BoxLikeStore store;
  final ILocationService locationService;

  @override
  _FeedListItemState createState() => _FeedListItemState();
}

class _FeedListItemState extends State<FeedListItem> {
  @override
  void dispose() {
    widget.store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, wdgt) {
        var value = 1.0;
        if (widget.pageController.position.haveDimensions) {
          value = widget.pageController.page - widget.index;
          value = (1 - value.abs() * 0.3).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) *
                MediaQuery.of(context).size.height *
                0.85,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: wdgt,
          ),
        );
      },
      animation: widget.pageController,
      child: GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, Screens.boxDetails, arguments: widget.box.id),
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
                child: _body(context),
              ),
            ),
            _likeButton(context),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _topTextRow(context),
          SizedBox(height: 10.0),
          Builder(builder: (ctx) {
            if (widget.box.books.length >= 4) {
              return _expandedCoverImages(context);
            } else if (widget.box.books.length == 3) {
              return _threeBooksCoverImages(context);
            } else if (widget.box.books.length == 2) {
              return _twoBooksCoverImages(context);
            } else {
              return _singleBookCoverImage(context);
            }
          }),
          SizedBox(height: 10.0),
          _categoryAndTitleColumn(context),
          SizedBox(height: 2.5),
          _description(context),
        ],
      ),
    );
  }

  Text _description(BuildContext context) {
    return Text(
      (widget.box.description == null || widget.box.description.isEmpty)
          ? S.of(context).feedNoDescription
          : widget.box.description,
      style: Theme.of(context).primaryTextTheme.subhead.copyWith(fontSize: 12.5),
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
          '${widget.box.books.length}',
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

  Widget _singleBookCoverImage(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.50;
    return Container(
      height: height,
      child: _bookToImage(height, widget.box.books.first),
    );
  }

  Widget _twoBooksCoverImages(BuildContext context) {
    const height = 180.0;
    const width = 147.0;
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: _bookToImage(height, widget.box.books[0]),
              height: height,
              width: width,
            ),
            SizedBox(height: 5.0),
            Container(
              child: _bookToImage(height, widget.box.books[1]),
              height: height,
              width: width,
            ),
          ],
        ),
      ),
    );
  }

  Widget _threeBooksCoverImages(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IgnorePointer(
              child: _coverImageGridView(200.0, count: 2),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: _bookToImage(200.0, widget.box.books[2]),
              height: 185.0,
              width: 130.0,
            ),
          ],
        ),
      ),
    );
  }

  Container _expandedCoverImages(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      child: _coverImageGridView(150.0),
    );
  }

  GridView _coverImageGridView(double height, {int count}) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      padding: EdgeInsets.all(0.0),
      childAspectRatio: 0.75,
      children: _extractImages(height, count: count),
    );
  }

  List<CachedNetworkImage> _extractImages(double height, {int count}) => widget.box.books
      .take(count ?? widget.box.books.length)
      .map((b) => _bookToImage(height, b))
      .toList();

  CachedNetworkImage _bookToImage(double height, BoxFeedBook book) {
    return CachedNetworkImage(
      imageBuilder: (ctx, imageProvider) => Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      imageUrl: book.thumbnailUrl ?? '',
      placeholder: (ctx, url) => SpinKitPulse(
        size: 20.0,
        color: Theme.of(ctx).primaryIconTheme.color,
      ),
      errorWidget: (ctx, url, error) =>
          Image.asset('assets/images/book_cover_placeholder.jpeg'),
    );
  }

  Column _categoryAndTitleColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          widget.box.books.toCategoryString(),
          style:
              Theme.of(context).primaryTextTheme.overline.copyWith(color: Colors.white70),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 5.0),
        Text(
          widget.box.title,
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
      bottom: 0.0,
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
            if (widget.store.isLoading) {
              return SpinKitPulse(
                size: 30.0,
                color: Theme.of(context).accentIconTheme.color,
              );
            }
            return Icon(
              widget.store.isLiked
                  ? MaterialCommunityIcons.heart
                  : MaterialCommunityIcons.heart_outline,
              color: Theme.of(context).accentIconTheme.color,
              size: 30.0,
            );
          }),
        ),
        onPressed: () {
          if (widget.store.isLoading) {
            return;
          }
          widget.store.toggleLikeStatus();
        },
      ),
    );
  }

  FutureBuilder<Dartz.Option<Placemark>> _locationBuilder() {
    return FutureBuilder<Dartz.Option<Placemark>>(
      future: widget.locationService.getLocationDataFrom(widget.box.lat, widget.box.lng),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return SpinKitPulse(
            size: 20.0,
            color: Theme.of(ctx).primaryIconTheme.color,
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
