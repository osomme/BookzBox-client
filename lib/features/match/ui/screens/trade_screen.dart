import 'package:bookzbox/common/widgets/widgets.dart';
import 'package:bookzbox/features/box/box.dart';
import 'package:bookzbox/features/match/match.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TradeScreen extends StatefulWidget {
  final MatchStore store;

  final String userId;

  const TradeScreen({
    Key key,
    @required this.store,
    @required this.userId,
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
      body: Center(
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
            child: Builder(builder: (ctx) {
              if (widget.store.anyOffersExist) {
                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text('There are trade offers. TODO: Complete this!'),
                    ],
                  ),
                );
              } else {
                return _NoOffers(userId: widget.userId);
              }
            }),
          ),
        ),
      ),
    );
  }
}

class _NoOffers extends StatelessWidget {
  final String userId;

  const _NoOffers({
    Key key,
    @required this.userId,
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
      builder: (ctx) => BoxTradeList(
        userId: userId,
        store: Provider.of<BoxSelectionStore>(context),
      ),
    );
    if (selectedBox != null) {
      print('Selected ${selectedBox.title}');
    }
  }
}
