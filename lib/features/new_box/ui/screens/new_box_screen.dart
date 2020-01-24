import 'package:bookzbox/features/box/models/book.dart';
import 'package:bookzbox/features/new_box/stores/new_box_store.dart';
import 'package:bookzbox/features/new_box/ui/widgets/book_card_widget.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class NewBoxScreen extends StatefulWidget {
  final NewBoxStore newBoxStore;

  NewBoxScreen(this.newBoxStore);

  @override
  _NewBoxScreenState createState() => _NewBoxScreenState();
}

class _NewBoxScreenState extends State<NewBoxScreen> {
  Future<void> handleBookLookup(BuildContext ctx) async {
    if ((await widget.newBoxStore.findBook()) == false) {
      return;
    }
    Navigator.of(ctx).pop();
    showBookDialog();
  }

  void addBookAndCloseDialog(BuildContext ctx) {
    widget.newBoxStore.addCurrentBook();

    Navigator.of(ctx).pop();
  }

  Container closeButton(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(0.0, 24, 0.0, 0.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          icon: Icon(
            Icons.close,
            size: 24.0,
            color: Theme.of(context).accentColor,
          ),
          tooltip: S.of(context).newBoxCloseTip,
          onPressed: () => setState(() => Navigator.pop(context)),
        ),
      ),
    );
  }

  Container publishButton(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(0.0, 24.0, 2.0, 0.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          icon: Icon(
            MaterialCommunityIcons.cube_send,
            size: 24.0,
            color: Theme.of(context).accentColor,
          ),
          tooltip: S.of(context).newBoxPublishTip,
          onPressed: () => print("Publish"),
        ),
      ),
    );
  }

  Container infoText(BuildContext context) {
    return new Container(
      constraints: BoxConstraints(minWidth: double.infinity),
      color: Theme.of(context).primaryColor,
      child: Container(
        margin: EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 6.0),
        child: Column(
          children: <Widget>[
            Text(
              S.of(context).newBoxTitle,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              S.of(context).newBoxInfo,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container addBooksButton(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
      child: OutlineButton(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: Align(
          alignment: Alignment(0.0, 0.0),
          child: Icon(
            Icons.plus_one,
            size: 24,
            color: Theme.of(context).primaryColor,
          ),
        ),
        onPressed: () => showIsbnDialog(),
      ),
    );
  }

  Text smallTitle(String text) {
    return new Text(
      text,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Row customTopBar(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                closeButton(context),
                Align(
                  alignment: Alignment.centerRight,
                  child: publishButton(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container triangleBackgroundWidget(BuildContext context) {
    return new Container(
      height: 64,
      constraints: BoxConstraints(minWidth: double.infinity),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.02, 0.0),
            stops: const [0.6, 0.7],
            colors: <Color>[
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor,
            ],
            tileMode: TileMode.clamp),
      ),
    );
  }

  List<Widget> genBookCards(BuildContext ctx, ObservableList<Book> books) {
    List<Widget> list = List.generate(books.length, (index) {
      return new BookCard(
        book: books[index],
        deleteFunc: widget.newBoxStore.removeBook,
      );
    });
    list.add(addBooksButton(ctx));
    return list;
  }

  /// Widget displaying the added books.
  Container booksWidget(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
      constraints: BoxConstraints(minWidth: double.infinity),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 4.0),
            child: smallTitle(S.of(context).newBoxBooksTitle),
          ),
          Observer(
            builder: (_) => GridView.count(
              padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
              childAspectRatio: 0.7,
              crossAxisCount: 6,
              shrinkWrap: true,
              children: genBookCards(context, widget.newBoxStore.books),
            ),
          ),
        ],
      ),
    );
  }

  Container boxTitleWidget(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
      constraints: BoxConstraints(minWidth: double.infinity),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          smallTitle(S.of(context).newBoxTitleTitle),
          TextField(
            maxLength: 50,
            maxLengthEnforced: true,
            onChanged: (value) => widget.newBoxStore.setBoxTitle(value),
          )
        ],
      ),
    );
  }

  Container boxDescriptionWidget(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
      constraints: BoxConstraints(minWidth: double.infinity),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          smallTitle(S.of(context).newBoxDescriptionTitle),
          TextField(
            maxLength: 500,
            maxLengthEnforced: true,
            maxLines: 5,
            minLines: 5,
            onChanged: (value) => widget.newBoxStore.setBoxDescription(value),
          )
        ],
      ),
    );
  }

  Future<void> showIsbnDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
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
              Observer(
                  builder: (_) => widget.newBoxStore.isLoadingBook
                      ? Center(child: CircularProgressIndicator())
                      : TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) => widget.newBoxStore.setIsbn(value),
                          decoration: InputDecoration(
                            counterText: "",
                            errorText: widget.newBoxStore.isbnErrorMsg,
                          ),
                        )),
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
                Observer(
                  builder: (_) => FlatButton(
                    child: Text(
                      S.of(context).newBoxFindBook,
                      style: TextStyle(color: Colors.deepPurple[900], fontWeight: FontWeight.w700),
                    ),
                    onPressed: () =>
                        widget.newBoxStore.isLoadingBook ? null : handleBookLookup(context),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> showBookDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          contentPadding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
          backgroundColor: Color.fromRGBO(252, 241, 233, 1.0),
          content: Container(
            padding: EdgeInsets.only(bottom: 12.0),
            decoration: BoxDecoration(
              border: new Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Colors.grey,
                ),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              (widget.newBoxStore.currentBook == null
                                  ? ""
                                  : widget.newBoxStore.currentBook.title),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              (widget.newBoxStore.currentBook == null
                                  ? ""
                                  : widget.newBoxStore.currentBook.subtitle),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: <Widget>[
                                Text(
                                  S.of(context).newBoxBookAuthor + ":",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  (widget.newBoxStore.currentBook == null
                                      ? ""
                                      : widget.newBoxStore.currentBook.author),
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  S.of(context).newBoxBookPublished + ":",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  (widget.newBoxStore.currentBook == null
                                      ? ""
                                      : (widget.newBoxStore.currentBook.publishYear.toString())),
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image.network(
                    (widget.newBoxStore.currentBook == null
                        ? null
                        : widget.newBoxStore.currentBook.thumbnailUrl),
                    fit: BoxFit.fill,
                    width: 70,
                    height: 100,
                  ),
                ),
              ],
            ),
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
                  child: Text(
                    S.of(context).newBoxAddBookButton,
                    style: TextStyle(color: Colors.deepPurple[900], fontWeight: FontWeight.w700),
                  ),
                  onPressed: () => addBookAndCloseDialog(context),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            customTopBar(context),
            infoText(context),
            triangleBackgroundWidget(context),
            booksWidget(context),
            boxTitleWidget(context),
            boxDescriptionWidget(context)
          ],
        ),
      ),
    );
  }
}
