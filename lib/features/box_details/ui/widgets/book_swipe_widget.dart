import 'package:bookzbox/common/widgets/widgets.dart';
import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BookSwiper extends StatefulWidget {
  /// A list of [Book]s to be displayed in the widget.
  final List<Book> books;

  /// The backgroundcolor of the widget.
  final Color backgroundColor;

  const BookSwiper({
    Key key,
    @required this.books,
    this.backgroundColor,
  }) : super(key: key);

  @override
  _BookSwiperState createState() => _BookSwiperState();
}

class _BookSwiperState extends State<BookSwiper> {
  Book book;

  @override
  void initState() {
    book = widget.books.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _swiper(),
        SizedBox(height: 30.0),
        _bookDetails(),
      ],
    );
  }

  void _onIndexChanged(int index) => setState(() => book = widget.books[index]);

  String stringifyBookCondition(BuildContext context, BookCondition condition) {
    switch (condition) {
      case BookCondition.Unknown:
        return S.of(context).bookConditionUnknown;
      case BookCondition.New:
        return S.of(context).bookConditionNew;
      case BookCondition.UsedLikeNew:
        return S.of(context).bookConditionLikeNew;
      case BookCondition.UsedGood:
        return S.of(context).bookConditionGood;
      case BookCondition.UsedAcceptable:
        return S.of(context).bookConditionAcceptable;
      case BookCondition.UsedDamaged:
        return S.of(context).bookConditionDamaged;
      default:
        throw IndexError;
    }
  }

  Container _swiper() {
    return Container(
      color: widget.backgroundColor ?? Theme.of(context).primaryColor,
      width: MediaQuery.of(context).size.width,
      height: 210.0,
      child: Theme(
        data: Theme.of(context).copyWith(primaryColor: Theme.of(context).accentColor),
        child: Swiper(
          outer: true,
          itemCount: widget.books.length,
          viewportFraction: 0.5,
          scale: 0.8,
          pagination: SwiperPagination(margin: EdgeInsets.only(top: 10.0)),
          control: SwiperControl(),
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CachedNetworkImage(
                imageBuilder: (ctx, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                imageUrl: widget.books[index].fullSizeImageUrl ??
                    widget.books[index].thumbnailUrl ??
                    '',
                placeholder: (ctx, url) => SpinKitPulse(
                  size: 20.0,
                  color: Theme.of(ctx).primaryIconTheme.color,
                ),
                errorWidget: (ctx, url, error) =>
                    Image.asset('assets/images/book_cover_placeholder.jpeg'),
              ),
            );
          },
          onIndexChanged: _onIndexChanged,
        ),
      ),
    );
  }

  Widget _bookDetails() {
    const rowGap = 15.0;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _bookDetailsTextCol(
              S.of(context).detailsBookTitle,
              book.title ?? '--',
              maxLines: 3,
            ),
          ],
        ),
        SizedBox(height: rowGap),
        Column(
          children: <Widget>[
            Text(
              S.of(context).detailsBookSynopsis,
              style: Theme.of(context)
                  .primaryTextTheme
                  .subtitle
                  .copyWith(color: Colors.white70),
            ),
            SizedBox(height: 10.0),
            ExpandableText(
              text: book.synopsis ?? S.of(context).detailsBookNoSynopsis,
            ),
            SizedBox(height: rowGap),
          ],
        ),
        SizedBox(height: rowGap),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _bookDetailsTextCol(S.of(context).detailsBookCondition,
                stringifyBookCondition(context, book.condition)),
            _bookDetailsTextCol(
                S.of(context).detailsBookPages, book.pageCount?.toString() ?? '--'),
          ],
        ),
        SizedBox(height: rowGap),
        Row(
          children: <Widget>[
            _bookDetailsTextCol(
                S.of(context).detailsBookAuthor, book.authors?.join(', ') ?? '--'),
            _bookDetailsTextCol(
                S.of(context).detailsBookPublisher, book.publisher ?? '--'),
          ],
        ),
        SizedBox(height: rowGap),
        Row(
          children: <Widget>[
            _bookDetailsTextCol(
              S.of(context).detailsBookCategories,
              book.categories.isNotEmpty ? book.categories.join(', ') : '--',
            ),
            _bookDetailsTextCol(S.of(context).detailsBookPublished,
                (book.publishYear != -1) ? book.publishYear.toString() : '--'),
          ],
        ),
      ],
    );
  }

  Widget _bookDetailsTextCol(String header, String content,
      {int maxLines = 2, TextStyle textStyle}) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              header,
              style: Theme.of(context)
                  .primaryTextTheme
                  .subtitle
                  .copyWith(color: Colors.white70),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 2.5),
            Text(
              content,
              style: textStyle ?? Theme.of(context).primaryTextTheme.subhead,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
