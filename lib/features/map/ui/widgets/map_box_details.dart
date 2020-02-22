import 'package:bookzbox/features/feed/feed.dart';
import 'package:flutter/material.dart';

class ModalBoxDetails extends StatelessWidget {
  final BoxFeedListItem box;

  const ModalBoxDetails({
    Key key,
    @required this.box,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Column(
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
      ),
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
      ? Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 175.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: box.books.length,
                itemBuilder: (ctx, i) {
                  return Row(
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            height: 150.0,
                            width: 100.0,
                            child: (box.books[i].thumbnailUrl != null)
                                ? Image.network(box.books[i].thumbnailUrl,
                                    fit: BoxFit.fill)
                                : Image.asset('assets/images/book_cover_placeholder.jpeg',
                                    fit: BoxFit.fill),
                          ),
                          SizedBox(height: 2.0),
                          Text(
                            box.books[i].categories.first ?? '',
                            style: Theme.of(context).primaryTextTheme.caption,
                          ),
                        ],
                      ),
                      (i + 1) < box.books.length
                          ? SizedBox(width: 5.0)
                          : SizedBox.shrink(),
                    ],
                  );
                },
              ),
            ),
          ),
        )
      : Container(
          child: Text(
            'No Images',
            style: Theme.of(context).primaryTextTheme.body2,
          ),
        );

  Widget _descriptionAndUsername(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Description',
          style:
              Theme.of(context).primaryTextTheme.subtitle.copyWith(color: Colors.white70),
        ),
        SizedBox(height: 5.0),
        Text(
          box.description,
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
          'Published on',
          style:
              Theme.of(context).primaryTextTheme.subtitle.copyWith(color: Colors.white70),
        ),
        SizedBox(height: 5.0),
        Text(
          box.publishedOn.toIso8601String(),
          style: Theme.of(context).primaryTextTheme.body2,
        ),
      ],
    );
  }

  Widget _buttonBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _button(
          icon: Icon(Icons.person),
          label: 'Profile',
          color: Colors.blue,
          onClick: () => print('Clicked profile'),
        ),
        _button(
          icon: Icon(Icons.zoom_in),
          label: 'Details',
          color: Colors.red,
          onClick: () => print('Clicked details'),
        ),
        _button(
          icon: Icon(Icons.favorite),
          label: 'Favorite',
          onClick: () => print('Clicked favorite'),
          color: Colors.orange,
        ),
      ],
    );
  }

  Widget _button({Icon icon, String label, Function onClick, Color color}) {
    return Column(
      children: <Widget>[
        ClipOval(
          child: Material(
            color: color,
            child: InkWell(
              splashColor: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 25.0,
                  height: 25.0,
                  child: icon,
                ),
              ),
              onTap: onClick,
            ),
          ),
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
