import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/box_details/ui/widgets/widgets.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        /*appBar: AppBar(
          title: Text('Box Details'),
          bottom: TabBar(
            indicatorColor: Theme.of(context).accentColor,
            labelColor: Theme.of(context).accentColor,
            unselectedLabelColor: Colors.white,
            indicatorWeight: 3.5,
            tabs: [
              Tab(
                text: 'Box',
                icon: Icon(
                  FontAwesome5Solid.box_open,
                  size: 20,
                ),
              ),
              Tab(
                text: 'Books',
                icon: Icon(
                  FontAwesome5Solid.book,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          BoxDetails(
            box: _testBox,
          ),
          Text('Second tab'),
        ]),*/
        body: BoxDetails(box: _testBox),
      ),
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
  Book(categories: ['Action', 'Drama', 'Comedy']),
];
