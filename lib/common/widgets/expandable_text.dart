import 'package:flutter/material.dart';

/// An expandable text widget that can contract and expand based on whether the user has pressed a button or not.
class ExpandableText extends StatefulWidget {
  /// The text content that makes up the widget. Cannot be null.
  final String text;

  /// The duration of the expand/detract animation. 200 miliseconds by default.
  final Duration duration;

  /// The color of the text. White by default.
  final Color textColor;

  /// The maximum height of the text box when in contracted state.
  final double maxTextDetractedHeight;

  const ExpandableText({
    Key key,
    @required this.text,
    this.textColor = Colors.white,
    this.duration = const Duration(milliseconds: 200),
    this.maxTextDetractedHeight = 150.0,
  }) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: widget.duration,
      vsync: this,
      child: ConstrainedBox(
        constraints: isExpanded
            ? BoxConstraints()
            : BoxConstraints(maxHeight: widget.maxTextDetractedHeight),
        child: GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Text(
            widget.text,
            softWrap: true,
            overflow: TextOverflow.fade,
            style: TextStyle(color: widget.textColor),
          ),
        ),
      ),
    );
  }
}
