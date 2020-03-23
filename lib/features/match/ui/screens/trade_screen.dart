import 'package:bookzbox/common/di/providers.dart';
import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/common/widgets/widgets.dart';
import 'package:bookzbox/features/box/box.dart';
import 'package:bookzbox/features/match/match.dart';
import 'package:bookzbox/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
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
        builder: (ctx) {
          if (widget.store.anyOffersExist) {
            return _Offers(
              offers: widget.store.offers,
              clientUserId: widget.userId,
            );
          } else {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.80,
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
                  child: _NoOffers(
                    userId: widget.userId,
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
        },
      ),
    );
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
