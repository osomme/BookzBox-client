import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';

/// An expandable text widget that can contract and expand based on whether the user has pressed a button or not.
class ExpandableText extends StatefulWidget {
  /// The text content that makes up the widget. Cannot be null.
  final String text;

  /// The color of the button text. White by default.
  final Color buttonColor;

  /// The duration of the expand/detract animation. 200 miliseconds by default.
  final Duration duration;

  /// The color of the text. White by default.
  final Color textColor;

  /// The text style of the button text content.
  final TextStyle buttonTextStyle;

  /// The contents of the text that is shown on the button when the text is contracted.
  final String expandTextContent;

  /// The contents of the text that is shown on the button when the text is expanded.
  final String detractTextContent;

  /// The maximum height of the text box when in contracted state.
  final double maxTextDetractedHeight;

  const ExpandableText({
    Key key,
    @required this.text,
    this.buttonColor,
    this.buttonTextStyle,
    this.textColor = Colors.white,
    this.duration = const Duration(milliseconds: 200),
    this.expandTextContent,
    this.detractTextContent,
    this.maxTextDetractedHeight = 150.0,
  }) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  bool isExpanded = false;

  TextStyle defaultButtonTextStyle(final Color color) => TextStyle(
        color: color,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    final color = widget.buttonColor ?? Theme.of(context).buttonColor;
    final buttonTextStyle = widget.buttonTextStyle ?? defaultButtonTextStyle(color);
    final expandedText =
        widget.expandTextContent ?? S.of(context).expandableShowLessButton;
    final contractedText =
        widget.expandTextContent ?? S.of(context).expandablekReadMoreButton;
    return Column(
      children: <Widget>[
        AnimatedSize(
          duration: widget.duration,
          vsync: this,
          child: ConstrainedBox(
            constraints: isExpanded
                ? BoxConstraints()
                : BoxConstraints(maxHeight: widget.maxTextDetractedHeight),
            child: Text(
              widget.text,
              softWrap: true,
              overflow: TextOverflow.fade,
              style: TextStyle(color: widget.textColor),
            ),
          ),
        ),
        FlatButton(
          onPressed: () => setState(() => this.isExpanded = !this.isExpanded),
          child: Text(
            isExpanded ? expandedText : contractedText,
            style: buttonTextStyle,
          ),
        ),
      ],
    );
  }
}
