import 'package:bookzbox/common/widgets/widgets.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/feed/feed.dart';
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
  void didChangeDependencies() {
    widget.feedStore.init(Provider.of<AuthStore>(context).user.uid);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget.feedStore.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        if (widget.feedStore.initialLoadingOngoing) {
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

  SizedBox _mainContent() {
    return SizedBox.expand(
      child: Container(
        child: Observer(
          builder: (_) => PageView.builder(
            controller: _pageController,
            itemCount: widget.feedStore.boxes.length,
            itemBuilder: (context, index) => FeedListItem(
              pageController: _pageController,
              index: index,
              box: widget.feedStore.boxes[index],
              locationService: Provider.of<ILocationService>(context),
              store: BoxLikeStore(
                Provider.of<IBoxLikeRepository>(context),
                Provider.of<IAuthService>(context),
                widget.feedStore.boxes[index].id,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
