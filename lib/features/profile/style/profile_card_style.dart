import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Shared style for cards on the profile page.
class ProfileCardStyle {
  static const TextStyle cardTitleStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    letterSpacing: 1.05,
    shadows: <Shadow>[
      Shadow(
        color: Colors.black54,
        blurRadius: 2.0,
        offset: Offset(1, 1),
      )
    ],
  );

  static const TextStyle cardSubTitleStyle = TextStyle(
    color: const Color(0xFFEEEEEE),
    fontSize: 16,
  );
}
