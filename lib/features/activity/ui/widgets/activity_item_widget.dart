import 'package:bookzbox/common/extensions/extensions.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';

/// Widget used to display an activity list item in a list of activity feed notifications.
class ActivityListItem extends StatelessWidget {
  /// The widget to display on the leftmost side of the item.
  final Widget leading;

  /// A list of subtitle texts. Is joined together to create one text.
  final List<ActivityItemTextParam> subtitleTexts;

  /// The widget to display on the rightmost side of the item.
  final Widget trailing;

  /// Whether the item is three lines tall.
  final bool isThreeLines;

  /// The function to call when the item is clicked.
  final VoidCallback onClick;

  /// The timestamp of the list item that is being displayed.
  final DateTime date;

  /// Whether the activity feed item has been read.
  final bool read;

  const ActivityListItem({
    Key key,
    @required this.leading,
    @required this.subtitleTexts,
    @required this.onClick,
    @required this.read,
    this.date,
    this.trailing,
    this.isThreeLines = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: read ? Colors.white : Colors.grey[100],
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
        leading: leading,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: [
                  ...subtitleTexts.map(
                    (p) => TextSpan(
                      text: p.content,
                      style: Theme.of(context).textTheme.body1.copyWith(
                            fontWeight: p.bold ? FontWeight.w600 : FontWeight.normal,
                            fontStyle: p.italic ? FontStyle.italic : FontStyle.normal,
                          ),
                    ),
                  ),
                ],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(date.toTimeDifferenceString(context)),
                read
                    ? SizedBox.shrink()
                    : Text(
                        S.of(context).activityNewItem,
                        style: Theme.of(context).textTheme.body1.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
              ],
            ),
          ],
        ),
        trailing: trailing,
        onTap: onClick,
        dense: true,
      ),
    );
  }
}

/// Class containing information that is used to determine the text style for a given text in the ActivityListItem widget.
class ActivityItemTextParam {
  /// The string content of the text.
  final String content;

  /// Whether the text is bold. False by default.
  final bool bold;

  /// Whether the text is italic. False by default.
  final bool italic;

  ActivityItemTextParam({
    @required this.content,
    this.bold = false,
    this.italic = false,
  });
}
