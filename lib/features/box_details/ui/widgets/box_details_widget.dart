import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/common/extensions/extensions.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BoxDetails extends StatelessWidget {
  final Box box;

  const BoxDetails({Key key, this.box}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _books(context),
            _details(),
          ],
        ),
      ),
    );
  }

  Container _books(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 30.0,
        right: 30.0,
        top: 50.0,
      ),
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              size: 30.0,
              color: Theme.of(context).primaryTextTheme.title.color,
            ),
          ),
          SizedBox(height: 30.0),
          BookSwiper(books: box.books),
          SizedBox(height: 50.0),
        ],
      ),
    );
  }

  Column _topLeftColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            size: 30.0,
            color: Theme.of(context).primaryTextTheme.title.color,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'TITLE',
          style:
              Theme.of(context).primaryTextTheme.subtitle.copyWith(color: Colors.white70),
        ),
        SizedBox(height: 5.0),
        Text(
          box.title,
          style: Theme.of(context).primaryTextTheme.subhead,
        ),
        SizedBox(height: 35.0),
        Text(
          'BOOKS',
          style:
              Theme.of(context).primaryTextTheme.subtitle.copyWith(color: Colors.white70),
        ),
        SizedBox(height: 5.0),
        Text(
          '${box.books.length}',
          style: Theme.of(context).primaryTextTheme.subhead,
        ),
        SizedBox(height: 35.0),
        Text(
          'CATEGORIES',
          style:
              Theme.of(context).primaryTextTheme.subtitle.copyWith(color: Colors.white70),
        ),
        SizedBox(height: 5.0),
        Text(
          box.books.toCategoryString().toLowerCase(),
          style: Theme.of(context).primaryTextTheme.subhead,
        ),
        SizedBox(height: 35.0),
        _likeButton(context),
      ],
    );
  }

  RawMaterialButton _likeButton(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => print('Clicked like button'),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
      elevation: 2.0,
      fillColor: Theme.of(context).accentColor,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).accentColor,
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Icon(
          MaterialCommunityIcons.heart,
          size: 60.0,
          color: Theme.of(context).accentIconTheme.color,
        ),
      ),
    );
  }

  Container _details() {
    return Container(
      transform: Matrix4.translationValues(0.0, -20.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  box.description,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'About the seller',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Registered 4 months ago',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'Very positive feedback',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
