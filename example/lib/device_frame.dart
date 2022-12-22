import 'package:flutter/material.dart';

class DeviceFrame extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double aspectRatio;

  const DeviceFrame({
    super.key,
    required this.aspectRatio,
    this.padding = const EdgeInsets.all(8),
    required this.child,
  });

  factory DeviceFrame.phone({Key? key, required Widget child}) {
    return DeviceFrame(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      aspectRatio: 9 / 16,
      child: child,
    );
  }

  factory DeviceFrame.desktop({Key? key, required Widget child}) {
    return DeviceFrame(
      key: key,
      padding: const EdgeInsets.all(16.0),
      aspectRatio: 16 / 9,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outline,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: padding,
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: ColoredBox(
            color: Theme.of(context).colorScheme.background,
            child: ClipRect(child: child),
          ),
        ),
      ),
    );
  }
}
