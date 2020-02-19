import 'package:bookzbox/features/profile/stores/profile_store.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Represents the me tab on the profile page
class MeTab extends StatelessWidget {
  final ProfileStore store;

  MeTab({Key key, @required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text('Me tab'),
    );
  }
}
