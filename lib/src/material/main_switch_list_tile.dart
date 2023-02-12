import 'package:flutter/material.dart';

/// {@category Material Design 1}
/// A customized SwitchListTile, used as the main switch of a page to enable or
/// disable the preferences on the page.
///
/// ## Replicating the Android Settings style
///
/// See also:
///
///  * [MainSwitchBar from the Android Open Source Project](https://cs.android.com/android/platform/superproject/+/master:frameworks/base/packages/SettingsLib/MainSwitchPreference/src/com/android/settingslib/widget/MainSwitchBar.java)
class MainSwitchListTile extends StatelessWidget implements SwitchListTile {
  @override
  final Color? activeColor;

  final Color? activeTileColor;

  @override
  final Color? tileColor;

  @override
  final ValueChanged<bool>? onChanged;

  @override
  final bool value;

  @override
  final Widget? title;

  @override
  final EdgeInsets? contentPadding;

  @override
  final ImageProvider<Object>? activeThumbImage;

  @override
  final Color? activeTrackColor;

  @override
  final bool autofocus;

  @override
  final ListTileControlAffinity controlAffinity;

  @override
  final bool? dense;

  @override
  final bool? enableFeedback;

  @override
  final FocusNode? focusNode;

  @override
  final Color? hoverColor;

  @override
  final Color? inactiveThumbColor;

  @override
  final ImageProvider<Object>? inactiveThumbImage;

  @override
  final Color? inactiveTrackColor;

  @override
  final bool isThreeLine;

  @override
  final Widget? secondary;

  @override
  final bool selected;

  @override
  final Color? selectedTileColor;

  @override
  final ShapeBorder? shape;

  @override
  final Widget? subtitle;

  @override
  final VisualDensity? visualDensity;

  final EdgeInsets? margin;

  const MainSwitchListTile({
    super.key,
    required this.onChanged,
    required this.value,
    this.activeColor,
    this.activeThumbImage,
    this.activeTileColor,
    this.activeTrackColor,
    this.autofocus = false,
    this.contentPadding,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.dense,
    this.enableFeedback,
    this.focusNode,
    this.hoverColor,
    this.inactiveThumbColor,
    this.inactiveThumbImage,
    this.inactiveTrackColor,
    this.isThreeLine = false,
    this.secondary,
    this.selected = false,
    this.selectedTileColor,
    this.shape,
    this.subtitle,
    this.tileColor,
    this.title,
    this.visualDensity,
    this.margin,
    this.onFocusChange,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeTileColor = this.activeTileColor ??
        (theme.useMaterial3
            ? theme.colorScheme.primary
            : theme.colorScheme.secondary);
    final activeColor = this.activeColor ??
        (theme.useMaterial3
            ? theme.colorScheme.onPrimary
            : theme.colorScheme.onSecondary);
    final tileColor = this.tileColor;
    final contentPadding = this.contentPadding == null
        ? null
        : const EdgeInsets.only(left: 16, right: 16).add(this.contentPadding!);

    Widget? title;

    if (this.title != null) {
      title = DefaultTextStyle.merge(
        style: value ? TextStyle(color: theme.colorScheme.onPrimary) : null,
        child: this.title!,
      );
    }

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: SwitchListTile(
        activeColor: activeColor,
        activeThumbImage: activeThumbImage,
        activeTrackColor: activeTrackColor,
        autofocus: autofocus,
        contentPadding: contentPadding,
        controlAffinity: controlAffinity,
        dense: dense,
        enableFeedback: enableFeedback,
        focusNode: focusNode,
        hoverColor: hoverColor,
        inactiveThumbColor: inactiveThumbColor,
        inactiveThumbImage: inactiveThumbImage,
        inactiveTrackColor: inactiveTrackColor,
        isThreeLine: isThreeLine,
        onChanged: onChanged,
        secondary: secondary,
        selected: selected,
        selectedTileColor: selectedTileColor,
        shape: shape,
        subtitle: subtitle,
        tileColor: value ? activeTileColor : tileColor,
        title: title,
        value: value,
        visualDensity: visualDensity,
        onFocusChange: onFocusChange,
      ),
    );
  }

  @override
  final ValueChanged<bool>? onFocusChange;
}
