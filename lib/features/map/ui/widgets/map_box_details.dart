import 'package:bookzbox/features/feed/stores/box_like_store.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class ModalBoxDetails extends StatelessWidget {
  final BoxMapItem box;

  final BoxLikeStore likeStore;

  const ModalBoxDetails({
    Key key,
    @required this.box,
    @required this.likeStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            _titleText(context),
            SizedBox(height: 20.0),
            _images(context),
            SizedBox(height: 10.0),
          ],
        ),
        _mainTextContent(context),
      ],
    );
  }

  Widget _titleText(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Text(
          box.title,
          style: Theme.of(context).primaryTextTheme.title,
        ),
      ),
    );
  }

  Widget _images(BuildContext context) => box.books.any((b) => b.thumbnailUrl != null)
      ? _imageList(context)
      : _noImagesText(context);

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
      height: 150.0,
      width: 100.0,
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

  Widget _descriptionAndUsername(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          S.of(context).mapDescription,
          style:
              Theme.of(context).primaryTextTheme.subtitle.copyWith(color: Colors.white70),
        ),
        SizedBox(height: 5.0),
        Text(
          (box.description == null || box.description.isEmpty)
              ? S.of(context).mapNoDescription
              : box.description,
          style: Theme.of(context).primaryTextTheme.body2,
        ),
      ],
    );
  }

  Widget _publishedOnText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          S.of(context).mapPublishedOn,
          style:
              Theme.of(context).primaryTextTheme.subtitle.copyWith(color: Colors.white70),
        ),
        SizedBox(height: 5.0),
        Text(
          DateFormat.yMMMd().add_jm().format(box.publishedOn),
          style: Theme.of(context).primaryTextTheme.body2,
        ),
      ],
    );
  }

  Widget _buttonBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _profileButton(context),
        _detailsButton(context),
        _likeButton(context),
      ],
    );
  }

  Widget _likeButton(BuildContext context) {
    return _actionButton(
      context,
      child: Observer(builder: (_) {
        if (likeStore.isLoading) {
          return SpinKitPulse(
            size: 25.0,
            color: Theme.of(context).accentIconTheme.color,
          );
        }
        return Icon(
          likeStore.isLiked
              ? MaterialCommunityIcons.heart
              : MaterialCommunityIcons.heart_outline,
          color: Theme.of(context).accentIconTheme.color,
          size: 25.0,
        );
      }),
      label: S.of(context).mapLikeLabel,
      onClick: () {
        if (likeStore.isLoading) {
          return;
        }
        likeStore.toggleLikeStatus();
      },
    );
  }

  Widget _detailsButton(BuildContext context) {
    return _actionButton(
      context,
      child: Icon(Icons.zoom_in),
      label: S.of(context).mapDetailsLabel,
      onClick: () => print('Clicked details'),
    );
  }

  Widget _profileButton(BuildContext context) {
    return _actionButton(
      context,
      child: Icon(Icons.person),
      label: S.of(context).mapProfileLabel,
      onClick: () => print('Clicked profile'),
    );
  }

  Widget _actionButton(BuildContext context,
      {Widget child, String label, Function onClick}) {
    return Column(
      children: <Widget>[
        RawMaterialButton(
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
          elevation: 2.0,
          fillColor: Theme.of(context).accentColor,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).accentColor,
                  blurRadius: 9.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: child,
          ),
          onPressed: onClick,
        ),
        SizedBox(height: 5.0),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  _mainTextContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _descriptionAndUsername(context),
          SizedBox(height: 20.0),
          _publishedOnText(context),
          SizedBox(height: 20.0),
          _buttonBar(context),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
