import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/common/widgets/circular_button.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:bookzbox/generated/l10n.dart';
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
            BookCoverList(box: widget.box),
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
