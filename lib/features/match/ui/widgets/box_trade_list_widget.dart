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
    return Observer(builder: (_) {
      if (store.isLoading) {
        return Center(
          child: SpinKitThreeBounce(
            color: Theme.of(context).primaryColor,
          ),
        );
      } else if (store.hasError) {
        return Center(
          child: Text('Failed to load boxes'), //TODO: Localize
        );
      }

      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Select a box', //TODO: Localize
              style:
                  Theme.of(context).textTheme.title.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 6.0),
            Text(
              'Choose the box that you wish to trade', //TODO: Localize
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisSize: MainAxisSize.min,
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
            SizedBox(height: 10.0),
            Row(
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
                        ? () => Navigator.pop(context, store.currentlySelected)
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
          ],
        ),
      );
    });
  }
}
