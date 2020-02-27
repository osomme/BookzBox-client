import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/box_details/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BoxDetailsScreen extends StatefulWidget {
  final String boxId;

  const BoxDetailsScreen({
    Key key,
    @required this.boxId,
  }) : super(key: key);

  @override
  _BoxDetailsScreenState createState() => _BoxDetailsScreenState();
}

class _BoxDetailsScreenState extends State<BoxDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BoxDetails(box: _testBox),
    );
  }
}

final _testBox = Box(
  id: '1',
  publisher: User('123'),
  books: _books,
  status: BoxStatus.public,
  publishDateTime: DateTime.now(),
  latitude: 13.23213,
  longitude: 122.232,
  title: 'Some old books that are no longer needed',
  description:
      'This is just a collection of books that I no longer have any use for and I wish to clear up some space that I need to install my enormous TV set so that I can watch the news. Thank you.',
);

final _books = [
  Book(
      isbn10: '232ASADEAE',
      isbn13: 'ASD3223ASDA23',
      title: 'Harry Potter and the Prisoner of Azkaban',
      subtitle: '',
      authors: ['J.K. Rowling'],
      pageCount: 582,
      publishYear: 2003,
      synopsis:
          'This is a book about a boy that has some kind of special power or whatever. There\'s some evil bad dude who wants to kill Harry but nobody knows why. Harry also has two friends that do everything for him.',
      categories: ['Action', 'Drama', 'Comedy'],
      fullSizeImageUrl: 'https://ewedit.files.wordpress.com/2016/09/kkhp7-lg.jpg?w=402'),
  Book(
      isbn10: '232ASADEAE',
      isbn13: 'ASD3223ASDA23',
      title: 'Star Wars 2',
      subtitle: '',
      authors: ['Some dmmy', 'Another dummy'],
      pageCount: 321,
      publishYear: 1956,
      synopsis: 'A science-fiction movie about some strange planets and religious nuts',
      categories: ['Action', 'Drama', 'Comedy'],
      fullSizeImageUrl:
          'https://ewedit.files.wordpress.com/2016/09/harry01english.jpg?w=408'),
  Book(
      isbn10: '232ASADEAE',
      isbn13: 'ASD3223ASDA23',
      title: 'Lord of the Rings',
      subtitle: '',
      authors: ['J.R.R. Tolkien'],
      pageCount: 582,
      publishYear: 2003,
      synopsis:
          'This is a book about a boy that has some kind of special power or whatever. There\'s some evil bad dude who wants to kill Harry but nobody knows why. Harry also has two friends that do everything for him.',
      categories: ['Action', 'Drama', 'Comedy'],
      thumbnailUrl:
          'https://yabookreviewer.files.wordpress.com/2013/07/harry-potter-half-blood-prince-new-cover.jpg'),
  Book(
      isbn10: '232ASADEAE',
      isbn13: 'ASD3223ASDA23',
      title: 'Harry Potter and the Prisoner of Azkaban',
      subtitle: 'A fantasy book about a boy',
      authors: ['J.K. Rowling'],
      pageCount: 582,
      publishYear: 2003,
      synopsis:
          'This is a book about a boy that has some kind of special power or whatever. There\'s some evil bad dude who wants to kill Harry but nobody knows why. Harry also has two friends that do everything for him.',
      categories: ['Action', 'Drama', 'Comedy']),
];
