import 'package:bookzbox/features/box/models/book.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Represents a thumbnail view of a book.
class BookCard extends StatelessWidget {
  final Book book;
  final Function(Book) deleteFunc;

  BookCard({Key key, @required this.book, this.deleteFunc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Offset tapPosition;
    return new GestureDetector(
      onTapDown: (details) => tapPosition = details.globalPosition,
      onTap: () {
        final RenderBox overlay = Overlay.of(context).context.findRenderObject();
        showMenu(
          context: context,
          position: RelativeRect.fromRect(tapPosition & Size(40, 40), Offset.zero & overlay.size),
          items: <PopupMenuEntry>[
            PopupMenuItem(
              height: 48.0,
              value: book,
              child: Row(
                children: <Widget>[
                  Icon(Icons.delete),
                  Text(S.of(context).newBoxRemoveBook),
                ],
              ),
            )
          ],
        ).then((var delta) {
          if (delta == null) return;

          deleteFunc(delta);
        });
      },
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: (book == null || book.thumbnailUrl == null
              ? Image.asset(
                  'assets/images/book_cover_placeholder.jpeg',
                  fit: BoxFit.fill,
                  width: 70,
                  height: 100,
                )
              : Image.network(
                  book.thumbnailUrl,
                  fit: BoxFit.fill,
                  width: 70,
                  height: 100,
                )),
        ),
      ),
    );
  }
}
