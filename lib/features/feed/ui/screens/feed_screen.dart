import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> with SingleTickerProviderStateMixin {
  PageController _pageController;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  AnimatedBuilder _plantSelector(int index) {
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
                                style: Theme.of(context).primaryTextTheme.subtitle,
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
                                style: Theme.of(context).primaryTextTheme.subtitle,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            plants[index].category.toUpperCase(),
                            style: Theme.of(context)
                                .primaryTextTheme
                                .subhead
                                .copyWith(color: Colors.white70),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 7.5),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 60.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    S.of(context).feedTitle,
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.settings, size: 30.0, color: Colors.grey[600]),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 500.0,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _selectedPage = index),
                itemCount: plants.length,
                itemBuilder: (context, index) => _plantSelector(index),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    S.of(context).feedDescription,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    plants[_selectedPage].description,
                    style: Theme.of(context).accentTextTheme.body1,
                  ),
                ],
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
