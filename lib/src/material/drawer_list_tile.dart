import 'package:flutter/material.dart';
import 'package:kaiteki_material/src/utils/margined_rounded_rectangle_border.dart';
import 'package:kaiteki_material/src/utils/margined_stadium_border.dart';

@Deprecated("Use Flutter's NavigationDrawer instead.")
class DrawerListTile extends StatelessWidget {
  final bool autofocus;

  /// The tile's internal padding.
  ///
  /// Insets a [ListTile]'s contents: its [leading], [title], [subtitle],
  /// and [trailing] widgets.
  ///
  /// If null, `EdgeInsets.only(right: 12.0)` is used.
  /// `EdgeInsets.symmetric(horizontal: 24, vertical: 4)` is being added too,
  /// which can be subtracted by using negative numbers.
  final EdgeInsetsGeometry? contentPadding;

  final bool? dense;

  final bool? enableFeedback;

  final bool enabled;

  final Color? focusColor;

  final FocusNode? focusNode;

  final double? horizontalTitleGap;

  final Color? hoverColor;

  final Color? iconColor;

  final bool isThreeLine;

  final Widget? leading;

  final double? minLeadingWidth;

  final double? minVerticalPadding;

  final MouseCursor? mouseCursor;

  final GestureLongPressCallback? onLongPress;

  final GestureTapCallback? onTap;

  final bool selected;

  final Color? selectedColor;

  final Color? selectedTileColor;

  final ShapeBorder? shape;

  final ListTileStyle? style;

  final Widget? subtitle;

  final Color? textColor;

  final Color? tileColor;

  final Widget? title;

  final Widget? trailing;

  final VisualDensity? visualDensity;

  final EdgeInsets? margin;

  const DrawerListTile({
    super.key,
    this.autofocus = false,
    this.contentPadding,
    this.dense,
    this.enableFeedback,
    this.enabled = true,
    this.focusColor,
    this.focusNode,
    this.horizontalTitleGap,
    this.hoverColor,
    this.iconColor,
    this.isThreeLine = false,
    this.leading,
    this.minLeadingWidth,
    this.minVerticalPadding,
    this.mouseCursor,
    this.onLongPress,
    this.onTap,
    this.selected = false,
    this.selectedColor,
    this.selectedTileColor,
    this.shape,
    this.style,
    this.subtitle,
    this.textColor,
    this.tileColor,
    this.title,
    this.trailing,
    this.visualDensity,
    this.margin,
    this.onFocusChange,
    this.splashColor,
    this.leadingAndTrailingTextStyle,
    this.subtitleTextStyle,
    this.titleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (!theme.useMaterial3) {
      final iconColor = selected
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).unselectedWidgetColor;

      final margin = this.margin ??
          const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4.0,
          );

      final shape = this.shape ??
          MarginedRoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            margin: margin,
          );

      return ListTile(
        leading: leading == null
            ? null
            : IconTheme(
                data: IconThemeData(color: iconColor),
                child: leading!,
              ),
        title: title == null
            ? null
            : DefaultTextStyle.merge(
                style: theme.textTheme.labelLarge, child: title!),
        selected: selected,
        onTap: onTap,
        selectedTileColor: theme.colorScheme.primary.withOpacity(.12),
        shape: shape,
        selectedColor: iconColor,
        style: ListTileStyle.drawer,
        trailing: trailing,
        splashColor: splashColor,
        onFocusChange: onFocusChange,
        leadingAndTrailingTextStyle: leadingAndTrailingTextStyle,
        subtitleTextStyle: subtitleTextStyle,
        titleTextStyle: titleTextStyle,
      );
    }

    final color = selected
        ? Theme.of(context).colorScheme.onSecondaryContainer
        : Theme.of(context).colorScheme.onSurfaceVariant;

    final margin = this.margin ?? const EdgeInsets.symmetric(horizontal: 12);
    final labelLarge = theme.textTheme.labelLarge ?? const TextStyle();

    final shape = this.shape ?? MarginedStadiumBorder(margin: margin);
    final contentPadding =
        this.contentPadding ?? const EdgeInsets.only(right: 12);

    return ListTile(
      leading: leading == null
          ? null
          : IconTheme(
              data: IconThemeData(color: color),
              child: leading!,
            ),
      title: title == null
          ? null
          : DefaultTextStyle.merge(
              style: labelLarge.copyWith(color: color),
              child: title!,
            ),
      selected: selected,
      onTap: onTap,
      shape: shape,
      selectedTileColor: theme.colorScheme.secondaryContainer,
      contentPadding: contentPadding.add(
        const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      ),
      minLeadingWidth: 12,
      trailing: trailing == null
          ? null
          : DefaultTextStyle.merge(
              style: labelLarge.copyWith(color: color),
              child: trailing!,
            ),
      textColor: color,
    );
  }

  final ValueChanged<bool>? onFocusChange;

  final Color? splashColor;

  @override
  final TextStyle? leadingAndTrailingTextStyle;

  @override
  final TextStyle? subtitleTextStyle;

  @override
  final TextStyle? titleTextStyle;
}
