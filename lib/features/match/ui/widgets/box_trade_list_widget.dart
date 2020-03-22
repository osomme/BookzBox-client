import 'package:bookzbox/features/box/box.dart';
import 'package:bookzbox/features/match/match.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BoxTradeList extends StatelessWidget {
  final BoxSelectionStore store;

  BoxTradeList({
    Key key,
    @required String userId,
    @required this.store,
  }) : super(key: key) {
    store.init(userId);
  }

  @override
  Widget build(BuildContext context) {
    if (store.isLoading) {
      return Center(
        child: SpinKitThreeBounce(),
      );
    } else if (store.hasError) {
      return Center(
        child: Text('Failed to load boxes'), //TODO: Localize
      );
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                ...store.boxes
                    .map((b) => RadioListTile<MiniBox>(
                          value: b,
                          groupValue: store.currentlySelected,
                          onChanged: (box) => store.setCurrentlySelected(box),
                          title: Text(b.title),
                          secondary: Image.network(
                            b.bookThumbnailUrl,
                            fit: BoxFit.contain,
                          ),
                        ))
                    .toList(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ), //TODO: Localize
                ),
                Observer(
                  builder: (_) => FlatButton(
                    onPressed: store.currentlySelected != null
                        ? () => Navigator.pop(context, [store.currentlySelected])
                        : null,
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: Colors.deepPurple[900], fontWeight: FontWeight.w700),
                    ), //TODO: Localize
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
