import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String profileImgUrl;
  final String displayName;
  final Color circleColor;
  final bool forceCircleColor;

  /// Constructor
  /// [profileImgUrl] Link to profile image, can be NULL.
  /// [displayName] Name, not NULL.
  ProfileAvatar({
    Key key,
    @required this.profileImgUrl,
    @required this.displayName,
    this.circleColor = Colors.grey,
    this.forceCircleColor = false,
  }) : super(key: key);

  Color getCircleColor() {
    if (forceCircleColor || displayName == null || displayName.isEmpty) {
      return circleColor;
    }
    // Material design guidelines state that the color must be the same
    // for the same user over time. The easiest way to do this is by 'hard-coding'
    // a users first initial up against colors.
    switch (displayName[0].toUpperCase()) {
      case 'A':
      case 'B':
      case 'C':
      case 'D':
      case 'E':
      case 'F':
        return Colors.blueAccent;

      case 'G':
      case 'H':
      case 'I':
      case 'J':
      case 'K':
      case 'L':
        return Colors.redAccent;

      case 'M':
      case 'N':
      case 'O':
      case 'P':
      case 'Q':
      case 'R':
        return Colors.orangeAccent;

      case 'S':
      case 'T':
      case 'U':
      case 'V':
      case 'W':
      case 'X':
      case 'Y':
      case 'Z':
        return Colors.purpleAccent;

      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: (profileImgUrl == null ? null : NetworkImage(profileImgUrl)),
      backgroundColor: getCircleColor(),
      radius: 16,
      foregroundColor: Colors.white,
      child: Text(
        (displayName.isNotEmpty ? displayName[0].toUpperCase() : ''),
      ),
    );
  }
}
