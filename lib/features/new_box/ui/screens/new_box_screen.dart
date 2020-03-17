import 'package:barcode_scan/barcode_scan.dart';
import 'package:bookzbox/common/screens/screen_names.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/box/models/book.dart';
import 'package:bookzbox/features/new_box/models/box_error.dart';
import 'package:bookzbox/features/new_box/models/lookup_error.dart';
import 'package:bookzbox/features/new_box/models/scan_error.dart';
import 'package:bookzbox/features/new_box/stores/new_box_store.dart';
import 'package:bookzbox/features/new_box/ui/widgets/book_card_widget.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

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
      margin: EdgeInsets.fromLTRB(8.0, 28, 0.0, 0.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          icon: Icon(
            Icons.close,
            size: 24.0,
            color: Theme.of(context).accentColor,
          ),
          tooltip: S.of(context).newBoxCloseTip,
          onPressed: () => setState(() {
            widget.newBoxStore.setBookCountError(BoxError.None);
            widget.newBoxStore.setTitleError(BoxError.None);
            widget.newBoxStore.books.clear();
            return Navigator.pop(context);
          }),
        ),
      ),
    );
  }

  Future<void> publishAndClosePage(BuildContext ctx, final User publisher) async {
    final result = await widget.newBoxStore.publishBox(publisher);
    result.fold(
      (error) => print("Publish error"),
      (box) {
        // Pop new box page so when user clicks bar they dont end up on the new box page.
        Navigator.pop(context);
        // Navigate to the details page for the newly published box.
        Navigator.pushNamed(context, Screens.boxDetails, arguments: box.id);
      },
    );
  }

  Container publishButton(BuildContext context, final User user) {
    return new Container(
      margin: EdgeInsets.fromLTRB(0.0, 28.0, 8.0, 0.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: FlatButton(
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 2.0),
                child: Text(
                  S.of(context).newBoxPublishTip,
                  style:
                      TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.w600),
                ),
              ),
              Icon(
                MaterialCommunityIcons.cube_send,
                size: 24.0,
                color: Theme.of(context).accentColor,
              ),
            ],
          ),
          onPressed: () => publishAndClosePage(context, user),
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

  Row customTopBar(BuildContext context, final AuthStore authStore) {
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
                  child: publishButton(context, authStore.user),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container gradientBackgroundWidget(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      constraints: BoxConstraints(
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        gradient: LinearGradient(
            begin: Alignment(1.0, -1.0),
            end: Alignment(1.0, 0.2),
            stops: const [0.9, 1.0],
            colors: <Color>[
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor,
            ],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
        child: Text(
          S.of(context).newBoxTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15,
            shadows: <Shadow>[
              Shadow(
                blurRadius: 1.0,
                color: Colors.black,
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
        ),
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
            child: Row(
              children: <Widget>[
                smallTitle(S.of(context).newBoxBooksTitle),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Observer(
                    builder: (_) => Text(
                      (widget.newBoxStore.bookCountError == BoxError.None
                          ? S.of(context).newBoxAddBookHelpText
                          : S.of(context).newBoxNoBooks),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        color: (widget.newBoxStore.bookCountError == BoxError.None
                            ? Colors.black
                            : Colors.red[900]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
      margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
      constraints: BoxConstraints(minWidth: double.infinity),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              smallTitle(S.of(context).newBoxTitleTitle),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Observer(
                  builder: (_) => Text(
                    (widget.newBoxStore.titleError == BoxError.None
                        ? ''
                        : S.of(context).newBoxInvalidTitle),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red[900],
                    ),
                  ),
                ),
              ),
            ],
          ),
          TextField(
            maxLength: 50,
            maxLengthEnforced: true,
            decoration: InputDecoration(
              hintText: S.of(context).newBoxTitleHintText,
            ),
            onChanged: (value) => widget.newBoxStore.setBoxTitle(value),
          ),
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
            decoration: InputDecoration(
              hintText: S.of(context).newBoxDescriptionHintText,
            ),
            onChanged: (value) => widget.newBoxStore.setBoxDescription(value),
          )
        ],
      ),
    );
  }

  void popIsbnDialog(BuildContext ctx) {
    Navigator.of(ctx).pop();
    widget.newBoxStore.setLookupError(LookupError.None);
  }

  String getIsbnScanErrorString(BuildContext ctx, ScanError err) {
    switch (err) {
      case ScanError.None:
        return '';
      case ScanError.BackPressed:
        return '';
      case ScanError.PermissionDenied:
        return S.of(ctx).newBoxCameraPermissionDenied;
      case ScanError.Unknown:
        return S.of(ctx).newBoxUnknownScanError;
      default:
        throw ArgumentError;
    }
  }

  Future<void> showIsbnDialog() async {
    widget.newBoxStore.setLookupError(LookupError.None);
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            S.of(context).newBoxIsbnDialogTitle,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          titlePadding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 8.0),
          contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
          backgroundColor: Color.fromRGBO(252, 241, 233, 1.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: widget.newBoxStore.toggleIsbnInfoBoxExpandedStatus,
                child: Container(
                  padding: const EdgeInsets.only(left: 18),
                  child: Row(
                    children: <Widget>[
                      Observer(
                        builder: (_) => Text(
                          (widget.newBoxStore.isIsbnInfoBoxExpanded
                              ? S.of(context).newBoxHideIsbnInfoText
                              : S.of(context).newBoxShowIsbnInfoText),
                          style: TextStyle(
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      Observer(
                        builder: (_) => Icon(
                          (widget.newBoxStore.isIsbnInfoBoxExpanded
                              ? MaterialIcons.expand_less
                              : MaterialIcons.expand_more),
                          color: Colors.grey[800],
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Observer(
                builder: (_) => AnimatedContainer(
                  height: (widget.newBoxStore.isIsbnInfoBoxExpanded ? 165 : 0),
                  duration: Duration(
                    seconds: 1,
                  ),
                  curve: Curves.easeOutExpo,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 6.0),
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.grey[200],
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text(
                                  S.of(context).newBoxIsbnInfoExampleIsbn,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                              Icon(
                                FontAwesome.barcode,
                                size: 64,
                              ),
                              Center(
                                child: Text(
                                  S.of(context).newBoxIsbnInfoExampleIsbnPlain,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Center(
                                  child: Text(
                                    S.of(context).newBoxIsbnInfoText,
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(18.0, 4.0, 18.0, 8.0),
                child: MaterialButton(
                  onPressed: scanIsbn,
                  child: Column(
                    children: <Widget>[
                      Observer(
                        builder: (_) => Text(
                          getIsbnScanErrorString(
                            context,
                            widget.newBoxStore.isbnScanError,
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red[900],
                          ),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Center(
                            child: Icon(
                              Ionicons.md_qr_scanner,
                              size: 112,
                            ),
                          ),
                          Center(
                            child: Text(
                              S.of(context).newBoxScanIsbnBtnText,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0.0),
                child: Column(
                  children: <Widget>[
                    Observer(
                      builder: (_) => Text(
                        (widget.newBoxStore.lookupError == LookupError.NotFound
                            ? S.of(context).newBoxBookNotFound
                            : ''),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red[900],
                        ),
                      ),
                    ),
                    Observer(
                      builder: (_) => widget.newBoxStore.isLoadingBook
                          ? Center(child: CircularProgressIndicator())
                          : TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) => widget.newBoxStore.setIsbn(value),
                              decoration: InputDecoration(
                                hintText: S.of(context).newBoxIsbnHintText,
                                helperText: S.of(context).newBoxIsbnFieldHelpText,
                                counterText: '',
                                errorText: (widget.newBoxStore.isbnError == LookupError.InvalidIsbn
                                    ? S.of(context).newBoxIsbnInvalid
                                    : null),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
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
                  onPressed: () => popIsbnDialog(context),
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

  /// Scans a barcode to read the ISBN.
  Future scanIsbn() async {
    try {
      String result = await BarcodeScanner.scan();
      print("Scanner result: " + result);
      widget.newBoxStore.setIsbn(result);
      handleBookLookup(context);
      widget.newBoxStore.setIsbnScanError(ScanError.None);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        print("User did not grant camera access.");
        widget.newBoxStore.setIsbnScanError(ScanError.PermissionDenied);
        //TODO: re-show permission dialog?
      } else {
        print("Error scanning: $e");
        widget.newBoxStore.setIsbnScanError(ScanError.Unknown);
      }
    } on FormatException {
      print("User returned from scanner without scanning anything (used back-button).");
      widget.newBoxStore.setIsbnScanError(ScanError.BackPressed);
    } catch (e) {
      print("Error scanning: $e");
      widget.newBoxStore.setIsbnScanError(ScanError.Unknown);
    }
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
                                  : (widget.newBoxStore.currentBook.title == null
                                      ? S.of(context).newBoxFieldPlaceholder
                                      : widget.newBoxStore.currentBook.title)),
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
                                  ? ''
                                  : (widget.newBoxStore.currentBook.subtitle == null
                                      ? ''
                                      : widget.newBoxStore.currentBook.subtitle)),
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
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),
                                  child: Text(
                                    S.of(context).newBoxBookAuthor + ":",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  (widget.newBoxStore.currentBook == null
                                      ? ""
                                      : (widget.newBoxStore.currentBook.authors[0] == null
                                          ? S.of(context).newBoxFieldPlaceholder
                                          : widget.newBoxStore.currentBook.authors[0])),
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),
                                  child: Text(
                                    S.of(context).newBoxBookPublished + ":",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  (widget.newBoxStore.currentBook == null
                                      ? ""
                                      : ((widget.newBoxStore.currentBook.publishYear < 1
                                          ? S.of(context).newBoxFieldPlaceholder
                                          : widget.newBoxStore.currentBook.publishYear
                                              .toString()))),
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
                  child: (widget.newBoxStore.currentBook == null ||
                          widget.newBoxStore.currentBook.thumbnailUrl == null
                      ? Image.asset(
                          'assets/images/book_cover_placeholder.jpeg',
                          fit: BoxFit.fill,
                          width: 70,
                          height: 100,
                        )
                      : Image.network(
                          widget.newBoxStore.currentBook.thumbnailUrl,
                          fit: BoxFit.fill,
                          width: 70,
                          height: 100,
                        )),
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
    final authStore = Provider.of<AuthStore>(context);
    return WillPopScope(
      onWillPop: () async {
        widget.newBoxStore.clear();
        return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); // Hides soft keyboard
          },
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    customTopBar(context, authStore),
                    infoText(context),
                    gradientBackgroundWidget(context),
                    booksWidget(context),
                    boxTitleWidget(context),
                    boxDescriptionWidget(context)
                  ],
                ),
              ),
              Observer(
                builder: (_) => Visibility(
                  visible: widget.newBoxStore.isPublishing,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 128),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        color: Colors.black26,
                      ),
                      padding: const EdgeInsets.all(48),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            S.of(context).newBoxIsPublishing,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 24),
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
