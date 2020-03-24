import 'package:bookzbox/common/di/providers.dart';
import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/common/widgets/widgets.dart';
import 'package:bookzbox/features/box/box.dart';
import 'package:bookzbox/features/match/match.dart';
import 'package:bookzbox/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TradeScreen extends StatefulWidget {
  final MatchStore store;

  final String userId;

  final String recipientId;

  const TradeScreen({
    Key key,
    @required this.store,
    @required this.userId,
    @required this.recipientId,
  }) : super(key: key);

  @override
  _TradeScreenState createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Manage Trade Offers'),
      ),
      body: Observer(
        builder: (ctx) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: _Content(
            clientUserOffer: widget.store.clientUserOffer,
            clientUserId: widget.userId,
            otherUserOffer: widget.store.otherUserOffer,
            onBoxSelected: (box) => widget.store.postOffer(
              TradeOffer.fromMiniBox(
                box,
                widget.userId,
                widget.recipientId,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final String clientUserId;
  final TradeOffer clientUserOffer;
  final TradeOffer otherUserOffer;
  final Function(MiniBox) onBoxSelected;

  const _Content({
    Key key,
    @required this.clientUserId,
    @required this.clientUserOffer,
    @required this.otherUserOffer,
    @required this.onBoxSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _match(
      ifOnlyClientUser: () => _OnlyClientUserHasOffer(
        offer: clientUserOffer,
        newOfferCallback: () => _openBoxSelectionDialog(context),
      ),
      ifOnlyOtherUser: () => _OnlyOtherUserHasOffer(
        offer: otherUserOffer,
        responseOfferCallback: () => _openBoxSelectionDialog(context),
      ),
      ifBoth: () => _BothUsersHaveOffers(
        clientUserOffer: clientUserOffer,
        otherUserOffer: otherUserOffer,
        newOfferCallback: () => _openBoxSelectionDialog(context),
      ),
      ifNeither: () => Text('TODO'),
    );
  }

  Widget _match({
    Widget Function() ifOnlyOtherUser,
    Widget Function() ifOnlyClientUser,
    Widget Function() ifBoth,
    Widget Function() ifNeither,
  }) {
    if (clientUserOffer == null && otherUserOffer != null) {
      // Client user has not posted an offer yet, but the other user has.
      return ifOnlyOtherUser();
    } else if (clientUserOffer != null && otherUserOffer == null) {
      // Client user has posted an offer, but the other user has not.
      return ifOnlyClientUser();
    } else if (clientUserOffer != null && otherUserOffer != null) {
      // Both users have posted an offer
      return ifBoth();
    } else {
      // Neither users have posted any offers.
      return ifNeither();
    }
  }

  void _openBoxSelectionDialog(BuildContext context) async {
    final selectedBox = await showDialog<MiniBox>(
      context: context,
      builder: (ctx) => Dialog(
        child: MultiProvider(
          providers: matchProviders,
          child: Consumer<BoxSelectionStore>(
            builder: (_, store, __) => Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.50,
              ),
              child: BoxTradeList(
                userId: clientUserId,
                store: store,
              ),
            ),
          ),
        ),
      ),
    );
    if (selectedBox != null) {
      print('Selected ${selectedBox.title}');
      onBoxSelected(selectedBox);
    }
  }
}

class _BothUsersHaveOffers extends StatelessWidget {
  final TradeOffer clientUserOffer;
  final TradeOffer otherUserOffer;
  final Function newOfferCallback;

  const _BothUsersHaveOffers({
    Key key,
    @required this.clientUserOffer,
    @required this.otherUserOffer,
    @required this.newOfferCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: _matchOffer(
            clientUserOffer,
            rejected: () => Column(
              children: <Widget>[
                _OfferColumn(
                  offer: clientUserOffer,
                  topText: 'Your offer was rejected:',
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                  onPressed: newOfferCallback,
                  color: Theme.of(context).accentColor,
                  child: Text(
                    'Make a new offer',
                    style: Theme.of(context).accentTextTheme.button,
                  ),
                ),
              ],
            ),
            accepted: () => _OfferColumn(
              offer: clientUserOffer,
              topText: 'Your offer was accepted',
              bottomText: '<username> accepted your offer!',
            ),
            waiting: () => _OfferColumn(
              offer: clientUserOffer,
              topText: 'Your offer:',
              bottomText: 'Waiting for <username> to respond to your offer',
            ),
          ),
        ),
        Center(
          child: Icon(
            Icons.compare_arrows,
            color: Theme.of(context).accentColor,
            size: 45.0,
          ),
        ),
        Expanded(
          child: _matchOffer(
            otherUserOffer,
            rejected: () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    FontAwesome5Solid.box_open,
                    size: 30.0,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Text(
                  'You have rejected <username>\'s offer. Wait for them to make another offer.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            accepted: () => _OfferColumn(
              offer: otherUserOffer,
              topText: '<username> offered:',
              bottomText: 'You accepted this offer',
            ),
            waiting: () => Column(
              children: <Widget>[
                _OfferColumn(
                  offer: otherUserOffer,
                  topText: '<username> is offering:',
                  bottomText: 'Respond to offer:',
                ),
                SizedBox(height: 15.0),
                Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => print('Pressed accept trade button'),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.check),
                          Text('Accept'),
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () => print('Pressed reject trade button'),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.clear),
                          Text('Reject'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _matchOffer(
    TradeOffer offer, {
    Widget Function() rejected,
    Widget Function() accepted,
    Widget Function() waiting,
  }) {
    if (offer.status == TradeOfferStatus.Rejected) {
      // The client's offer was rejected
      rejected();
    } else if (offer.status == TradeOfferStatus.Accepted) {
      // The client's offer was accepted
      accepted();
    } else if (offer.status == TradeOfferStatus.Waiting) {
      // The client's offer has not been responded to yet
      waiting();
    }
    return Center(
      child: Text('Unknown trade offer status'),
    );
  }
}

class _OnlyOneUserHasOffer extends StatelessWidget {
  final TradeOffer offer;
  final Widget bottomSection;

  const _OnlyOneUserHasOffer({
    Key key,
    @required this.offer,
    @required this.bottomSection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Top bar
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'Your trade offer:',
                style: Theme.of(context).primaryTextTheme.title,
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  Screens.boxDetails,
                  arguments: offer.boxId,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 150.0,
                      child: Image.network(
                        offer.boxThumbnailUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          offer.boxTitle,
                          style: Theme.of(context).primaryTextTheme.title,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          offer.timestamp.toTimeDifferenceString(context),
                          style: Theme.of(context).primaryTextTheme.caption,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).accentColor,
          height: 0,
          thickness: 1.0,
        ),
        bottomSection,
      ],
    );
  }
}

class _OnlyClientUserHasOffer extends StatelessWidget {
  final TradeOffer offer;
  final Function newOfferCallback;

  const _OnlyClientUserHasOffer({
    Key key,
    @required this.offer,
    @required this.newOfferCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final offerIsWaiting = offer.status == TradeOfferStatus.Waiting;
    return _OnlyOneUserHasOffer(
      offer: offer,
      bottomSection: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                offerIsWaiting ? FontAwesome5Solid.question : Foundation.alert,
                size: 30.0,
                color: Theme.of(context).accentColor,
              ),
            ),
            Text(
              offerIsWaiting
                  ? 'Waiting for response from <username>...'
                  : '<username> rejected your trade offer',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 10.0),
            offerIsWaiting
                ? SizedBox.shrink()
                : FlatButton(
                    onPressed: newOfferCallback,
                    child: Text('Make a new trade offer'),
                  ),
          ],
        ),
      ),
    );
  }
}

/// Widget to show when only the other user (not client user) has posted a trade offer.
class _OnlyOtherUserHasOffer extends StatelessWidget {
  final TradeOffer offer;
  final Function responseOfferCallback;

  const _OnlyOtherUserHasOffer({
    Key key,
    @required this.offer,
    @required this.responseOfferCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final offerIsWaiting = offer.status == TradeOfferStatus.Waiting;
    return _OnlyOneUserHasOffer(
      offer: offer,
      bottomSection: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                FontAwesome5Solid.box_open,
                size: 30.0,
                color: Theme.of(context).accentColor,
              ),
            ),
            Text(
              offerIsWaiting
                  ? '<username> has sent you a trade offer'
                  : 'You have rejected <username>\'s trade offer',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 10.0),
            offerIsWaiting
                ? FlatButton(
                    onPressed: responseOfferCallback,
                    child: Text('Accept offer'),
                  )
                : SizedBox.shrink(), //TODO: Add button for rejecting offer
          ],
        ),
      ),
    );
  }
}

class _OfferColumn extends StatelessWidget {
  final String topText;
  final String bottomText;
  final TradeOffer offer;

  const _OfferColumn({
    Key key,
    @required this.offer,
    @required this.topText,
    this.bottomText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          topText,
          style: Theme.of(context).primaryTextTheme.body2.copyWith(fontSize: 12.0),
        ),
        SizedBox(height: 20.0),
        Text(
          offer.boxTitle,
          style: Theme.of(context)
              .primaryTextTheme
              .body2
              .copyWith(fontSize: 12.0, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 20.0),
        Container(
          height: 180.0,
          child: Image.network(offer.boxThumbnailUrl, fit: BoxFit.contain),
        ),
        SizedBox(height: 20.0),
        bottomText != null
            ? Text(
                bottomText,
                style: Theme.of(context).primaryTextTheme.body2.copyWith(fontSize: 12.0),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
