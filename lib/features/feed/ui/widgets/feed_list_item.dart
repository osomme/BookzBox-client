import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FeedListItem extends StatelessWidget {
  const FeedListItem({
    Key key,
    @required PageController pageController,
    @required this.index,
    @required this.box,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;
  final int index;
  final Box box;

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
            height: Curves.easeInOut.transform(value) * 500.0,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                S.of(context).feedLocation,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle
                                    .copyWith(color: Colors.white70),
                              ),
                              Text(
                                '>Location<', //TODO: Replace with actual location from lat lng
                                style: Theme.of(context).primaryTextTheme.subhead,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                S.of(context).feedBooks,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle
                                    .copyWith(color: Colors.white70),
                              ),
                              Text(
                                '${box.books.length}',
                                style: Theme.of(context).primaryTextTheme.subhead,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Hero(
                        tag: box.id,
                        child: Image(
                          height: 250.0,
                          image: NetworkImage(box.books.first.thumbnailUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Column(
                        children: <Widget>[
                          Text(
                            '<CATEGORIES>'
                                .toUpperCase(), //TODO: Insert the actual categories
                            style: Theme.of(context)
                                .primaryTextTheme
                                .subhead
                                .copyWith(color: Colors.white70),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 4.0,
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
                  child: Icon(
                    MaterialCommunityIcons.heart_outline,
                    color: Theme.of(context).accentIconTheme.color,
                    size: 30.0,
                  ),
                ),
                onPressed: () => print('Clicked add to favorite button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
