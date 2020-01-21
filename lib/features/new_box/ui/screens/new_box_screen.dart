import 'package:bookzbox/features/new_box/models/book.dart';
import 'package:bookzbox/features/new_box/ui/widgets/book_card_widget.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NewBoxScreen extends StatefulWidget {
  @override
  _NewBoxScreenState createState() => _NewBoxScreenState();
}

class _NewBoxScreenState extends State<NewBoxScreen> {
  List<Widget> getBookWidgets(BuildContext context) {
    List<Widget> booksWidgets = new List();
    booksWidgets.add(addBooksButton(context));
    booksWidgets.add(new BookCard(book: new Book('a', 'a', 'a')));
    booksWidgets.add(new BookCard(book: new Book('a', 'a', 'a')));
    booksWidgets.add(new BookCard(book: new Book('a', 'a', 'a')));
    booksWidgets.add(new BookCard(book: new Book('a', 'a', 'a')));
    return booksWidgets;
  }

  Container closeButton(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(0.0, 24, 0.0, 0.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          icon: Icon(
            Icons.close,
            size: 24.0,
            color: Theme.of(context).accentColor,
          ),
          tooltip: S.of(context).newBoxCloseTip,
          onPressed: () => setState(() => Navigator.pop(context)),
        ),
      ),
    );
  }

  Container publishButton(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(0.0, 24.0, 2.0, 0.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          icon: Icon(
            MaterialCommunityIcons.cube_send,
            size: 24.0,
            color: Theme.of(context).accentColor,
          ),
          tooltip: S.of(context).newBoxPublishTip,
          onPressed: () => print("Publish button pressed!"),
        ),
      ),
    );
  }

  Container infoText(BuildContext context) {
    return new Container(
      constraints: BoxConstraints(minWidth: double.infinity),
      color: Theme.of(context).primaryColor,
      child: Container(
        margin: EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 6.0),
        child: Column(
          children: <Widget>[
            Text(
              'Create a box',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Creating a box is easy. First, add the books you want to trade. Second, write a short description and publish the box for the world. ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container addBooksButton(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
      child: OutlineButton(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: Align(
          alignment: Alignment(0.0, 0.0),
          child: Icon(
            Icons.plus_one,
            size: 24,
            color: Theme.of(context).primaryColor,
          ),
        ),
        onPressed: () => print('Add book pressed'),
      ),
    );
  }

  Text smallTitle(String text) {
    return new Text(
      "Books",
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Row customTopBar(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                closeButton(context),
                Align(
                  alignment: Alignment.centerRight,
                  child: publishButton(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container triangleBackgroundWidget(BuildContext context) {
    return new Container(
      height: 64,
      constraints: BoxConstraints(minWidth: double.infinity),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.02, 0.0),
            stops: const [0.6, 0.7],
            colors: <Color>[
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor,
            ],
            tileMode: TileMode.clamp),
      ),
    );
  }

  /// Returns the widget displaying the added books.
  Container booksWidget(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
      constraints: BoxConstraints(minWidth: double.infinity),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          smallTitle('Books'),
          GridView.count(
            padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
            childAspectRatio: 0.7,
            crossAxisCount: 6,
            shrinkWrap: true,
            children: getBookWidgets(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Column(
        children: <Widget>[
          customTopBar(context),
          infoText(context),
          triangleBackgroundWidget(context),
          booksWidget(context),
        ],
      ),
    );
  }
}
