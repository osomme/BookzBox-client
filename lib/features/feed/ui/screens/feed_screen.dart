import 'package:bookzbox/common/widgets/keys.dart';
import 'package:bookzbox/common/widgets/widgets.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/feed/ui/widgets/ad_card.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:bookzbox/features/location/location.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  final FeedStore feedStore;

  const FeedScreen({Key key, this.feedStore}) : super(key: key);

  @override
  _FeedScreenState createState() {
    feedStore.boxes.clear();
    return _FeedScreenState();
  }
}

class _FeedScreenState extends State<FeedScreen> with SingleTickerProviderStateMixin {
  AuthStore _authStore;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  void didChangeDependencies() {
    _authStore = Provider.of<AuthStore>(context);
    widget.feedStore.init(_authStore?.user?.uid ?? '');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        if (widget.feedStore.initialLoadingOngoing && widget.feedStore.boxes.isEmpty) {
          return Center(
            child: SpinKitThreeBounce(
              color: Theme.of(context).primaryColor,
            ),
          );
        }
        if (widget.feedStore.boxes.isEmpty) {
          return ErrorTextWithIcon(
            text: S.of(context).feedNoBoxesFound,
            icon: Icon(
              Entypo.box,
              color: Colors.grey,
              size: 64.0,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: _mainContent(),
          );
        }
      }),
    );
  }

  List<Widget> getFeedCards(List<BoxFeedListItem> boxes) {
    List<Widget> cards = List();

    for (int index = 0; index < boxes.length; index++) {
      if (index % 5 == 0 && index != 0) {
        cards.add(AdCard(pageController: _pageController, index: cards.length));
      }
      int newIndex = cards.length;
      cards.add(FeedListItem(
        key: Key(Keys.feedItemKey + newIndex.toString()),
        pageController: _pageController,
        index: newIndex,
        box: boxes[index],
        locationService: Provider.of<ILocationService>(context),
        store: BoxLikeStore(
          Provider.of<IBoxLikeRepository>(context),
          Provider.of<IAuthService>(context),
          boxes[index].id,
        ),
      ));
    }

    return cards;
  }

  SizedBox _mainContent() {
    return SizedBox.expand(
      child: Container(
        child: Observer(
          builder: (_) => PageView(
            controller: _pageController,
            children: getFeedCards(widget.feedStore.boxes),
            onPageChanged: (index) async {
              if (index == (widget.feedStore.boxes.length - 5)) {
                await widget.feedStore.fetchBoxes(_authStore?.user?.uid);
              }
              if ((index - 1) >= 0) {
                // Marks the previous box as read/seen.
                await widget.feedStore.markAsRead(_authStore?.user?.uid, index - 1);
              }
            },
          ),
        ),
      ),
    );
  }
}
