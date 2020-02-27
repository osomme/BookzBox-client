import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final Widget child;

  const DetailsCard({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: child,
      ),
    );
  }
}
