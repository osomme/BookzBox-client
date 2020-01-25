import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/feed/stores/box_item_store.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  final FeedStore feedStore;

  const FeedScreen({Key key, this.feedStore}) : super(key: key);

  @override
  _FeedScreenState createState() {
    feedStore.init();
    return _FeedScreenState();
  }
}

class _FeedScreenState extends State<FeedScreen> with SingleTickerProviderStateMixin {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    widget.feedStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).feedTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(SimpleLineIcons.options),
            onPressed: () => print('Options pressed'),
          ),
        ],
      ),
      body: Observer(builder: (_) {
        if (widget.feedStore.initialLoadingOngoing) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (widget.feedStore.boxes.isEmpty) {
          return Center(
            child: Text('No boxes found...'), //TODO: Add localized string
          );
        } else {
          return _mainContent();
        }
      }),
    );
  }

  ListView _mainContent() {
    return ListView(
      padding: EdgeInsets.only(bottom: 60.0),
      children: <Widget>[
        Container(
          height: 500.0,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => widget.feedStore.setIndex(index),
            itemCount: widget.feedStore.boxes.length,
            itemBuilder: (context, index) => FeedListItem(
              pageController: _pageController,
              index: index,
              box: widget.feedStore.boxes[index],
              store: BoxItemStore(
                Provider.of<IBoxLikeRepository>(context),
                Provider.of<IAuthService>(context),
                widget.feedStore.boxes[index],
              ),
            ),
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
              Observer(
                builder: (_) => Text(
                  widget.feedStore.boxes[widget.feedStore.currentIndex].description,
                  style: Theme.of(context).accentTextTheme.body1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
