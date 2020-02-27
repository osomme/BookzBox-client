import 'package:bookzbox/common/widgets/circular_button.dart';
import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/common/extensions/extensions.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BoxDetails extends StatelessWidget {
  final Box box;

  const BoxDetails({Key key, this.box}) : super(key: key);

  static const _boxInfoHeader = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
  );

  static const _boxInfoBody = TextStyle(
    fontSize: 16.0,
    color: Colors.black87,
  );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _books(context),
            _details(context),
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

  Container _details(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0.0, -20.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30.0),
            Text(
              'Description',
              style: _boxInfoHeader,
            ),
            SizedBox(height: 10.0),
            Text(
              box.description,
              style: _boxInfoBody,
            ),
            SizedBox(height: 30.0),
            Text(
              'About the seller',
              style: _boxInfoHeader,
            ),
            SizedBox(height: 10.0),
            Text(
              'Registered 4 months ago',
              style: _boxInfoBody,
            ),
            Text(
              'Very positive feedback',
              style: _boxInfoBody,
            ),
            SizedBox(height: 30.0),
            Text('Location', style: _boxInfoHeader),
            SizedBox(height: 10.0),
            Text('Gausel, Stavanger, Rogaland',
                style: _boxInfoBody), //TODO: Add location service dependency
            SizedBox(height: 30.0),
            Text('Status', style: _boxInfoHeader),
            SizedBox(height: 10.0),
            Text('Active', style: _boxInfoBody),
            SizedBox(height: 30.0),
            Text('Published On', style: _boxInfoHeader),
            SizedBox(height: 10.0),
            Text('23. April 2020', style: _boxInfoBody),
            SizedBox(height: 30.0),
            _buttonBar(context),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  Row _buttonBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CircularButton(
          child: Icon(
            MaterialCommunityIcons.heart,
            size: 30.0,
            color: Theme.of(context).accentIconTheme.color,
          ),
          label: 'Like',
          onClick: () => print('Like clicked'),
          textColor: Colors.black,
          padding: 15.0,
        ),
        CircularButton(
          child: Icon(
            Icons.person,
            size: 30.0,
          ),
          label: 'Profile',
          onClick: () => print('Profile clicked'),
          textColor: Colors.black,
          padding: 15.0,
        ),
      ],
    );
  }
}
