import 'package:flutter/material.dart';

/// {@category Material Design 3}
class BadgeTheme extends ThemeExtension<BadgeTheme> {
  final Color? containerColor;
  final Color? contentColor;

  const BadgeTheme({
    this.containerColor,
    this.contentColor,
  });

  @override
  ThemeExtension<BadgeTheme> copyWith({
    Color? containerColor,
    Color? contentColor,
  }) {
    return BadgeTheme(
      containerColor: containerColor ?? this.containerColor,
      contentColor: contentColor ?? this.contentColor,
    );
  }

  @override
  ThemeExtension<BadgeTheme> lerp(ThemeExtension<BadgeTheme>? other, double t) {
    if (other is! BadgeTheme) return this;

    return BadgeTheme(
      containerColor: Color.lerp(containerColor, other.containerColor, t),
      contentColor: Color.lerp(contentColor, other.contentColor, t),
    );
  }
}
