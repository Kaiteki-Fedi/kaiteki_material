import 'package:flutter/material.dart';

import '../utils/text_inherited_icon_theme.dart';

/// {@category Async}
class AsyncSnackBarContent extends StatelessWidget {
  final Icon icon;
  final Text text;
  final bool done;
  final Widget? trailing;

  const AsyncSnackBarContent({
    super.key,
    required this.icon,
    required this.text,
    required this.done,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: Stack(
            children: [
              CircularProgressIndicator(
                value: done ? 1 : null,
              ),
              Positioned.fill(
                child: Align(
                  child: TextInheritedIconTheme(child: icon),
                ),
              ),
            ],
          ),
        ),
        text,
        const Spacer(),
        if (trailing != null) trailing!,
      ],
    );
  }
}
