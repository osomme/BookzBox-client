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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Client user column
        Expanded(
          child: _match(
            ifOnlyOtherUser: () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesome5Solid.box_open,
                  size: 30.0,
                  color: Theme.of(context).primaryIconTheme.color,
                ),
                SizedBox(height: 20.0),
                Text(
                  'No trade offer yet',
                  style:
                      Theme.of(context).primaryTextTheme.body2.copyWith(fontSize: 12.0),
                ),
              ],
            ),
            ifOnlyClientUser: () => _HasOfferColumn(
              offer: clientUserOffer,
              topText: 'Trade offer:',
              bottomText: 'Waiting for <username> to respond...',
            ),
            ifBoth: () => _HasOfferColumn(
              offer: clientUserOffer,
              topText: 'You offered:',
              bottomText: '<username> has accepted your trade offer!',
            ),
            ifNeither: () => _NoOffers(
              userId: clientUserId,
              onBoxSelected: (box) => onBoxSelected(box),
            ),
          ),
        ),
        // Middle arrows
        Center(
          child: Icon(
            Icons.compare_arrows,
            size: 55.0,
            color: Theme.of(context).primaryIconTheme.color,
          ),
        ),
        // Other user column
        Expanded(
          child: _match(
            ifOnlyOtherUser: () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _HasOfferColumn(
                  offer: otherUserOffer,
                  topText: '<username> wants to trade:',
                  bottomText: null,
                ),
                FlatButton(
                  onPressed: () => _openBoxSelectionDialog(context),
                  child: Text(
                    'Accept offer',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .button
                        .copyWith(color: Theme.of(context).accentColor),
                  ),
                ),
              ],
            ),
            ifOnlyClientUser: () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesome5Solid.question, size: 30.0),
                Text('Waiting for <username> to respond...'),
              ],
            ),
            ifBoth: () => _HasOfferColumn(
              offer: otherUserOffer,
              topText: '<username> offered:',
              bottomText: 'You have accepted <username>\'s trade offer!',
            ),
            ifNeither: () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesome5Solid.question, size: 30.0),
                Text('<username> has not made an offer yet'),
              ],
            ),
          ),
        ),
      ],
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

class _HasOfferColumn extends StatelessWidget {
  final String topText;
  final String bottomText;
  final TradeOffer offer;

  const _HasOfferColumn({
    Key key,
    @required this.offer,
    @required this.topText,
    @required this.bottomText,
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
        /*
        Row(
          children: <Widget>[
            _iconFromStatus(offer.status),
            SizedBox(width: 5.0),
            Text(bottomText),
          ],
        ),*/
      ],
    );
  }

  Widget _iconFromStatus(TradeOfferStatus status) {
    const size = 20.0;
    switch (status) {
      case TradeOfferStatus.Accepted:
        return Icon(
          Icons.check_circle,
          color: Colors.green,
          size: size,
        );
      case TradeOfferStatus.Rejected:
        return Icon(
          Icons.block,
          color: Colors.red,
          size: size,
        );
      case TradeOfferStatus.Waiting:
        return Icon(
          Icons.warning,
          color: Colors.yellow[800],
          size: size,
        );
      default:
        throw 'Unknown TradeOfferStatus value. Was $status';
    }
  }
}

class _Offers extends StatelessWidget {
  final List<TradeOffer> offers;
  final String clientUserId;

  const _Offers({
    Key key,
    @required this.offers,
    @required this.clientUserId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: offers.length,
      reverse: false,
      itemBuilder: (ctx, i) {
        final offer = offers[i];
        final offerIsByClientUser = offer.offerByUserId == clientUserId;
        return Container(
          height: 150.0,
          constraints: BoxConstraints(maxHeight: 225.0),
          child: Card(
            margin: const EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _iconFromStatus(offer.status),
                      SizedBox(height: 10.0),
                      _textFromStatus(offer.status, ctx),
                      SizedBox(height: 15.0),
                      Text(offer.timestamp.toTimeDifferenceString(context)),
                    ],
                  ),
                  SizedBox(width: 14.0),
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          child: Center(child: Text(offer.boxTitle)),
                          onTap: () => Navigator.pushNamed(
                            context,
                            Screens.boxDetails,
                            arguments: offer.boxId,
                          ),
                        ),
                      ),
                      offerIsByClientUser
                          ? SizedBox.shrink()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                FlatButton(
                                  onPressed: () => print('Pressed accept button'),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.check),
                                      Text('Accept'),
                                    ],
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () => print('Pressed reject button'),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.block),
                                      Text('Reject'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                  SizedBox(width: 14.0),
                  Container(
                    child: Image.network(
                      offer.boxThumbnailUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Text _textFromStatus(TradeOfferStatus status, BuildContext ctx) {
    final style = Theme.of(ctx).accentTextTheme.caption;
    switch (status) {
      case TradeOfferStatus.Accepted:
        return Text(
          'Offer Accepted',
          style: style,
        );
      case TradeOfferStatus.Rejected:
        return Text(
          'Offer Rejected',
          style: style,
        );
      case TradeOfferStatus.Waiting:
        return Text(
          'Waiting for Response',
          style: style,
        );
      default:
        throw 'Unknown TradeOfferStatus value. Was $status';
    }
  }

  Widget _iconFromStatus(TradeOfferStatus status) {
    const size = 45.0;
    switch (status) {
      case TradeOfferStatus.Accepted:
        return Icon(
          Icons.check_circle,
          color: Colors.green,
          size: size,
        );
      case TradeOfferStatus.Rejected:
        return Icon(
          Icons.block,
          color: Colors.red,
          size: size,
        );
      case TradeOfferStatus.Waiting:
        return Icon(
          Icons.warning,
          color: Colors.yellow[800],
          size: size,
        );
      default:
        throw 'Unknown TradeOfferStatus value. Was $status';
    }
  }
}

class _NoOffers extends StatelessWidget {
  final String userId;
  final void Function(MiniBox) onBoxSelected;

  const _NoOffers({
    Key key,
    @required this.userId,
    @required this.onBoxSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ErrorTextWithIcon(
            text: 'No trade offers made yet, make one?',
            icon: Icon(Icons.swap_horiz, size: 60.0),
            textColor: Colors.black.withAlpha(200),
          ),
          SizedBox(height: 40.0),
          RaisedButton(
            child: Text('Select box'),
            onPressed: () => _openBoxSelectionDialog(context),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).primaryTextTheme.button.color,
          ),
        ],
      ),
    );
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
                userId: userId,
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
