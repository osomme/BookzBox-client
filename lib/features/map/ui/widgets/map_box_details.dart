import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/common/widgets/circular_button.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class ModalBoxDetails extends StatefulWidget {
  final BoxMapItem box;

  final BoxLikeStore likeStore;

  final AuthStore authStore;

  const ModalBoxDetails({
    Key key,
    @required this.box,
    @required this.likeStore,
    @required this.authStore,
  }) : super(key: key);

  @override
  _ModalBoxDetailsState createState() => _ModalBoxDetailsState();
}

class _ModalBoxDetailsState extends State<ModalBoxDetails> {
  @override
  void dispose() {
    widget.likeStore.dispose();
    super.dispose();
  }

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
          widget.box.title,
          style: Theme.of(context).primaryTextTheme.title,
        ),
      ),
    );
  }

  Widget _images(BuildContext context) =>
      widget.box.books.any((b) => b.thumbnailUrl != null)
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
            itemCount: widget.box.books.length,
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
                  (i + 1) < widget.box.books.length
                      ? SizedBox(width: 5.0)
                      : SizedBox.shrink(),
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
      widget.box.books[index].categories.first ?? '',
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
        imageUrl: widget.box.books[index].thumbnailUrl ?? '',
        placeholder: (ctx, url) => SpinKitPulse(
          size: 20.0,
          color: Theme.of(ctx).primaryIconTheme.color,
        ),
        errorWidget: (ctx, url, error) => Image.asset(
            'assets/images/book_cover_placeholder.jpeg'), //TODO: Replace with better placeholder?
      ),
    );
  }

  Widget _description(BuildContext context) {
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
          (widget.box.description == null || widget.box.description.isEmpty)
              ? S.of(context).mapNoDescription
              : widget.box.description,
          style: Theme.of(context).primaryTextTheme.body2,
          maxLines: 7,
          overflow: TextOverflow.ellipsis,
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
          DateFormat.yMMMd().add_jm().format(widget.box.publishedOn),
          style: Theme.of(context).primaryTextTheme.body2,
        ),
      ],
    );
  }

  Widget _buttonBarWithLikeBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _profileButton(context),
        _detailsButton(context),
        _likeButton(context),
      ],
    );
  }

  Widget _buttonBarWithoutLikeBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _profileButton(context),
        _detailsButton(context),
      ],
    );
  }

  Widget _likeButton(BuildContext context) {
    return CircularButton(
        child: Observer(builder: (_) {
          if (widget.likeStore.isLoading) {
            return SpinKitPulse(
              size: 25.0,
              color: Theme.of(context).accentIconTheme.color,
            );
          }
          return Icon(
            widget.likeStore.isLiked
                ? MaterialCommunityIcons.heart
                : MaterialCommunityIcons.heart_outline,
            color: Theme.of(context).accentIconTheme.color,
            size: 25.0,
          );
        }),
        label: S.of(context).mapLikeLabel,
        onClick: () {
          if (widget.likeStore.isLoading) {
            return;
          }
          widget.likeStore.toggleLikeStatus();
        });
  }

  Widget _detailsButton(BuildContext context) {
    return CircularButton(
        child: Icon(Icons.zoom_in),
        label: S.of(context).mapDetailsLabel,
        onClick: () => Navigator.pushNamed(context, Screens.boxDetails,
            arguments: widget.box.boxId));
  }

  Widget _profileButton(BuildContext context) {
    return CircularButton(
        child: Icon(Icons.person),
        label: S.of(context).mapProfileLabel,
        onClick: () => Navigator.pushNamed(context, Screens.profile,
            arguments: widget.box.publishedById));
  }

  _mainTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _description(context),
              SizedBox(height: 20.0),
              _publishedOnText(context),
              SizedBox(height: 20.0),
            ],
          ),
        ),
        Observer(builder: (ctx) {
          if (widget.authStore.isLoggedIn &&
              widget.authStore.user.uid == widget.box.publishedById) {
            return _buttonBarWithoutLikeBtn(context);
          } else {
            return _buttonBarWithLikeBtn(context);
          }
        }),
        SizedBox(height: 20.0),
      ],
    );
  }
}
