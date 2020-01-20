import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FeedListItem extends StatelessWidget {
  const FeedListItem({
    Key key,
    @required PageController pageController,
    @required this.index,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;
  final int index;

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
                                plants[index].location,
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
                                '${plants[index].books}',
                                style: Theme.of(context).primaryTextTheme.subhead,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Hero(
                        tag: plants[index].imageUrl,
                        child: Image(
                          height: 250.0,
                          image: NetworkImage(plants[index].imageUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Column(
                        children: <Widget>[
                          Text(
                            plants[index].category.toUpperCase(),
                            style: Theme.of(context)
                                .primaryTextTheme
                                .subhead
                                .copyWith(color: Colors.white70),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            plants[index].name,
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

/// Used for inserting fake values for testing purposes. Should be removed after UI design is completed.
class BoxListing {
  final String imageUrl;
  final String name;
  final String category;
  final int books;
  final String location;
  final String description;

  BoxListing({
    this.imageUrl,
    this.name,
    this.category,
    this.books,
    this.location,
    this.description,
  });
}

final List<BoxListing> plants = [
  BoxListing(
    imageUrl:
        'https://149349728.v2.pressablecdn.com/wp-content/uploads/2019/05/Untitled-design-27.png',
    name: 'Crime and thriller books and stuff and this is a long title',
    category: 'Thriller, Action, Suspense',
    books: 7,
    location: 'Halden',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus efficitur placerat orci, sed luctus ante ornare id. In et facilisis purus. Nunc ipsum eros, feugiat ac ligula at, ultricies porta augue. Etiam vel metus a tellus bibendum consectetur sit amet nec mi. Sed in turpis id nulla tristique eleifend. Pellentesque ultrices ac tortor id suscipit. Aliquam non dapibus mauris. Nunc tincidunt tristique odio, in tempus nunc rhoncus et. ',
  ),
  BoxListing(
    imageUrl:
        'https://1.bp.blogspot.com/-G1fAng3vVg8/WJuEc9l5CLI/AAAAAAAAVTA/ppuLiXBJx6Mxe_RQvCKWJl9qJvvTlF62wCLcB/s1600/fullprebrith.png',
    name: 'Just some romance novels',
    category: 'Romance, Action, Love',
    books: 5,
    location: 'Trondheim',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur.',
  ),
  BoxListing(
    imageUrl: 'http://www.datasikkerhetsboka.no/datasikkerhet.jpg',
    name: 'Collection of school books',
    category: 'Educational, School, Science',
    books: 12,
    location: 'Stavanger',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',
  ),
];
