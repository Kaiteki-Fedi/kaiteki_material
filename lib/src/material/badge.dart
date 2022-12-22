import 'package:flutter/material.dart';
import 'package:kaiteki_material/src/material/badge_theme.dart';

const _smallBadgeBorderRadius = BorderRadius.all(Radius.circular(6.0));
const _largeBadgeBorderRadius = BorderRadius.all(Radius.circular(16.0));

/// {@category Material Design 3}
/// A badge represents dynamic information such as a number of pending requests in a navigation bar.
///
/// Badges can be icon only or contain short text.
///
/// See also:
///
///  * <https://m3.material.io/components/badges>
///  * [Equivalent in Jetpack Compose](https://developer.android.com/reference/kotlin/androidx/compose/material3/package-summary#Badge(androidx.compose.ui.Modifier,androidx.compose.ui.graphics.Color,androidx.compose.ui.graphics.Color,kotlin.Function1))
class Badge extends StatelessWidget {
  final Widget? child;

  bool get isSmall => child == null;

  const Badge.large({super.key, required Widget this.child});
  const Badge.small({super.key}) : child = null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final badgeTheme = theme.extension<BadgeTheme>();
    final containerColor =
        badgeTheme?.containerColor ?? theme.colorScheme.error;
    final contentColor = badgeTheme?.contentColor ?? theme.colorScheme.onError;

    if (isSmall) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: _smallBadgeBorderRadius,
        ),
        child: const SizedBox.square(dimension: 6.0),
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: _largeBadgeBorderRadius,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 16.0,
          minWidth: 16.0,
        ),
        child: Center(
          child: DefaultTextStyle.merge(
            style: theme.textTheme.labelSmall?.copyWith(
              color: contentColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
