import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IsbnDialog extends StatelessWidget {
  // The function to be called when find book is pressed.
  final VoidCallback onFindBook;
  final bool isLoading;

  IsbnDialog({
    Key key,
    @required this.onFindBook,
    @required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        S.of(context).newBoxIsbnDialogTitle,
        style: TextStyle(fontSize: 15),
      ),
      titlePadding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 4.0),
      contentPadding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 2.0),
      backgroundColor: Color.fromRGBO(252, 241, 233, 1.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 13,
            maxLengthEnforced: true,
            decoration: InputDecoration(
              counterText: "",
            ),
          )
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
              child: Text(
                S.of(context).newBoxCancelDialog,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Text(
                      S.of(context).newBoxFindBook,
                      style: TextStyle(color: Colors.deepPurple[900], fontWeight: FontWeight.w700),
                      //style: Theme.of(context).accentTextTheme.button,
                    ),
              onPressed: isLoading ? null : onFindBook,
            ),
          ],
        ),
      ],
    );
  }
}
