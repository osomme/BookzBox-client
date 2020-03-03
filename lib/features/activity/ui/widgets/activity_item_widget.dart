import 'package:bookzbox/common/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ActivityListItem extends StatelessWidget {
  final Icon leadingIcon;
  final String title;
  final String subtitle;
  final Widget trailing;
  final bool isThreeLines;
  final VoidCallback onClick;

  const ActivityListItem({
    Key key,
    @required this.leadingIcon,
    @required this.title,
    @required this.subtitle,
    @required this.onClick,
    this.trailing,
    this.isThreeLines = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: leadingIcon,
        title: Text(
          title,
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(subtitle.take(80).appendEllipsisWhenLength(80)),
        trailing: trailing,
        onTap: onClick,
        isThreeLine: isThreeLines,
      ),
    );
  }
}
