import 'package:flutter/material.dart';

import 'badge.dart';

/// {@category Material Design 3}
/// Material Design badge box.
///
/// See also:
///
///  * [Equivalent in Jetpack Compose](https://developer.android.com/reference/kotlin/androidx/compose/material3/package-summary#BadgedBox(kotlin.Function1,androidx.compose.ui.Modifier,kotlin.Function1))
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
        if (badge.isSmall)
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
    return BadgedBox(badge: const Badge.small(), child: this);
  }

  Widget wrapWithLargeBadge(int? count, [int max = 999]) {
    if (count == null || count < 1) return this;

    final label = count > max ? "$max+" : count.toString();
    return BadgedBox(
      badge: Badge.large(child: Text(label)),
      child: this,
    );
  }
}
