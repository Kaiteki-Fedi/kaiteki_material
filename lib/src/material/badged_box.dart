import 'package:flutter/material.dart';

/// {@category Material Design 3}
/// Material Design badge box.
///
/// See also:
///
///  * [Equivalent in Jetpack Compose](https://developer.android.com/reference/kotlin/androidx/compose/material3/package-summary#BadgedBox(kotlin.Function1,androidx.compose.ui.Modifier,kotlin.Function1))
@Deprecated("Use Fluter's Badge.child instead.")
class BadgedBox extends StatelessWidget {
  final Badge badge;
  final Widget child;

  const BadgedBox({super.key, required this.badge, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (!badge.isLabelVisible)
          Positioned(top: 0, right: 0, child: badge)
        else
          Positioned(top: -4, left: 12, child: badge),
      ],
    );
  }
}

extension BadgedBoxWidgetExtensions on Widget {
  Widget wrapWithSmallBadge([bool showBadge = true]) {
    if (!showBadge) return this;
    return Badge(child: this);
  }

  Widget wrapWithLargeBadge(int? count, [int max = 999]) {
    if (count == null || count < 1) return this;

    final label = count > max ? "$max+" : count.toString();
    return Badge(
      label: Text(label),
      child: this,
    );
  }
}
