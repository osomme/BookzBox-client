import 'package:bookzbox/common/extensions/extensions.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';

class ActivityListItem extends StatelessWidget {
  final Widget leading;
  final List<ActivityItemTextParam> subtitleTexts;
  final Widget trailing;
  final bool isThreeLines;
  final VoidCallback onClick;
  final DateTime date;
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
      color: read ? Colors.white : Colors.grey[200],
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
  final String content;
  final bool bold;
  final bool italic;

  ActivityItemTextParam({
    @required this.content,
    this.bold = false,
    this.italic = false,
  });
}
