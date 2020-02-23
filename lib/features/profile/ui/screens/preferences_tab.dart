import 'package:bookzbox/features/profile/stores/profile_store.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Represents the user preferences tab on the profile page
class PreferencesTab extends StatelessWidget {
  final ProfileStore store;

  PreferencesTab({Key key, @required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text('Preferences tab'),
    );
  }
}
