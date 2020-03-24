import 'package:bookzbox/common/di/providers.dart';
import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/common/widgets/error_text_with_icon.dart';
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
        title: Text('Trade Offers'),
      ),
      body: Observer(
        builder: (ctx) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: _Content(
            clientUserOffer: widget.store.clientUserOffer,
            clientUserId: widget.userId,
            otherUserOffer: widget.store.otherUserOffer,
            onBoxSelected: _onBoxSelected,
            onOfferAccepted: _onOfferAccepted,
            onOfferRejected: _onOfferRejected,
          ),
        ),
      ),
    );
  }

  void _onBoxSelected(MiniBox box) {
    widget.store.postOffer(
      TradeOffer.fromMiniBox(
        box,
        widget.userId,
        widget.recipientId,
      ),
    );
  }

  void _onOfferRejected(TradeOffer offer) => widget.store.rejectOffer(offer);

  void _onOfferAccepted(TradeOffer offer) => widget.store.acceptOffer(offer);
}

class _Content extends StatelessWidget {
  final String clientUserId;
  final TradeOffer clientUserOffer;
  final TradeOffer otherUserOffer;
  final Function(MiniBox) onBoxSelected;
  final Function(TradeOffer) onOfferRejected;
  final Function(TradeOffer) onOfferAccepted;

  const _Content({
    Key key,
    @required this.clientUserId,
    @required this.clientUserOffer,
    @required this.otherUserOffer,
    @required this.onBoxSelected,
    @required this.onOfferRejected,
    @required this.onOfferAccepted,
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
        acceptOfferCallback: () => _openBoxSelectionDialog(context),
        rejectionCallback: onOfferRejected,
      ),
      ifBoth: () => _BothUsersHaveOffers(
        clientUserOffer: clientUserOffer,
        otherUserOffer: otherUserOffer,
        onOfferAccepted: onOfferAccepted,
        onOfferRejected: onOfferRejected,
        newOfferCallback: () => _openBoxSelectionDialog(context),
      ),
      ifNeither: () => _NoUserHasPostedOffer(
        newOfferCallback: () => _openBoxSelectionDialog(context),
      ),
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
      print('[TRADE SCREEN] Selected ${selectedBox.title}');
      onBoxSelected(selectedBox);
    }
  }
}

class _NoUserHasPostedOffer extends StatelessWidget {
  final Function newOfferCallback;

  const _NoUserHasPostedOffer({
    Key key,
    @required this.newOfferCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ErrorTextWithIcon(
          text: 'No trade offers yet',
          icon: Icon(
            Entypo.new_message,
            size: 50.0,
            color: Theme.of(context).accentColor,
          ),
          textColor: Colors.white.withAlpha(200),
        ),
        SizedBox(height: 15.0),
        RaisedButton(
          color: Theme.of(context).accentColor,
          onPressed: newOfferCallback,
          child: Text(
            'Make new trade offer',
            style: Theme.of(context).accentTextTheme.button,
          ),
        ),
      ],
    );
  }
}

class _BothUsersHaveOffers extends StatelessWidget {
  final TradeOffer clientUserOffer;
  final TradeOffer otherUserOffer;
  final Function newOfferCallback;
  final Function(TradeOffer) onOfferRejected;
  final Function(TradeOffer) onOfferAccepted;

  const _BothUsersHaveOffers({
    Key key,
    @required this.clientUserOffer,
    @required this.otherUserOffer,
    @required this.newOfferCallback,
    @required this.onOfferRejected,
    @required this.onOfferAccepted,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _OfferColumn(
                  offer: clientUserOffer,
                  topText: 'You offered:',
                  bottomText: 'Offer was rejected.',
                ),
                SizedBox(height: 5.0),
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            clientUserOffer.status == TradeOfferStatus.Accepted &&
                    otherUserOffer.status == TradeOfferStatus.Accepted
                ? Text(
                    'Trade Complete',
                    style: Theme.of(context).primaryTextTheme.caption,
                  )
                : SizedBox.shrink(),
            Icon(
              Icons.compare_arrows,
              color: Theme.of(context).accentColor,
              size: 45.0,
            ),
          ],
        ),
        Expanded(
          child: _matchOffer(
            otherUserOffer,
            rejected: () => _OfferColumn(
              offer: otherUserOffer,
              topText: '<username>\'s offer:',
              bottomText:
                  'You rejected this offer. Waiting for <username> to make a new offer.',
            ),
            accepted: () => _OfferColumn(
              offer: otherUserOffer,
              topText: '<username> offered:',
              bottomText: 'You accepted the offer',
            ),
            waiting: () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _OfferColumn(
                  offer: otherUserOffer,
                  topText: '<username> is offering:',
                  bottomText: 'Respond to offer:',
                ),
                SizedBox(height: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => onOfferAccepted(otherUserOffer),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.check,
                            color: Theme.of(context).accentColor,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Accept',
                            style: Theme.of(context).primaryTextTheme.button,
                          ),
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () => onOfferRejected(otherUserOffer),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.clear,
                            color: Theme.of(context).accentColor,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Reject',
                            style: Theme.of(context).primaryTextTheme.button,
                          ),
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
      return rejected();
    } else if (offer.status == TradeOfferStatus.Accepted) {
      // The client's offer was accepted
      return accepted();
    } else if (offer.status == TradeOfferStatus.Waiting) {
      // The client's offer has not been responded to yet
      return waiting();
    }
    return Center(
      child: Text('Unknown trade offer status'),
    );
  }
}

class _OnlyOneUserHasOffer extends StatelessWidget {
  final TradeOffer offer;
  final Widget bottomSection;
  final Widget topSection;

  const _OnlyOneUserHasOffer({
    Key key,
    @required this.offer,
    @required this.bottomSection,
    @required this.topSection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Top bar
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              topSection,
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
                          'Offer was made ' +
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
      topSection: Text(
        'You made a trade offer:',
        style: Theme.of(context).primaryTextTheme.headline,
      ),
      bottomSection: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                offerIsWaiting ? FontAwesome5Solid.question : Foundation.alert,
                size: 30.0,
                color: Theme.of(context).accentColor,
              ),
            ),
            Text(
              offerIsWaiting
                  ? 'Waiting for response from <username>...'
                  : '<username> rejected this trade offer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withAlpha(200),
              ),
            ),
            SizedBox(height: 10.0),
            offerIsWaiting
                ? SizedBox.shrink()
                : RaisedButton(
                    color: Theme.of(context).accentColor,
                    onPressed: newOfferCallback,
                    child: Text(
                      'Make a new trade offer',
                      style: Theme.of(context).accentTextTheme.button,
                    ),
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
  final Function acceptOfferCallback;
  final Function(TradeOffer) rejectionCallback;

  const _OnlyOtherUserHasOffer({
    Key key,
    @required this.offer,
    @required this.acceptOfferCallback,
    @required this.rejectionCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final offerIsWaiting = offer.status == TradeOfferStatus.Waiting;
    return _OnlyOneUserHasOffer(
      offer: offer,
      topSection: Center(
        child: Text(
          offerIsWaiting
              ? '<username> has sent you a trade offer for:'
              : 'You rejected <username>\'s trade offer of:',
          style: Theme.of(context).primaryTextTheme.body2.copyWith(fontSize: 16.0),
        ),
      ),
      bottomSection: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            offerIsWaiting
                ? Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'What would you like to do?',
                      style: Theme.of(context).primaryTextTheme.subtitle,
                    ),
                  )
                : SizedBox.shrink(),
            SizedBox(height: 10.0),
            offerIsWaiting
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.green,
                        onPressed: acceptOfferCallback,
                        child: Text(
                          'Accept',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      RaisedButton(
                        color: Colors.red,
                        onPressed: () => rejectionCallback(offer),
                        child: Text(
                          'Reject',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'You have rejected the offer, wait for <username> to make another offer, or make one yourself.',
                          style: Theme.of(context).primaryTextTheme.body1,
                        ),
                        SizedBox(height: 10.0),
                        RaisedButton(
                          color: Theme.of(context).accentColor,
                          onPressed: acceptOfferCallback,
                          child: Text(
                            'Make offer',
                            style: Theme.of(context).accentTextTheme.button,
                          ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
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
          SizedBox(height: 4.0),
          Text(
            offer.timestamp.toTimeDifferenceString(context),
            style: Theme.of(context).primaryTextTheme.caption,
          ),
          SizedBox(height: 20.0),
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, Screens.boxDetails, arguments: offer.boxId),
            child: Container(
              height: 180.0,
              child: Image.network(offer.boxThumbnailUrl, fit: BoxFit.contain),
            ),
          ),
          SizedBox(height: 20.0),
          bottomText != null
              ? Text(
                  bottomText,
                  style:
                      Theme.of(context).primaryTextTheme.body1.copyWith(fontSize: 13.0),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
