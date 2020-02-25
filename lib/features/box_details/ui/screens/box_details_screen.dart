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
        appBar: AppBar(
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
                  FontAwesome5Solid.box_open,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Center(
            child: Text(widget.boxId),
          ),
          Center(
            child: Text('Second tab'),
          ),
        ]),
      ),
    );
  }
}
