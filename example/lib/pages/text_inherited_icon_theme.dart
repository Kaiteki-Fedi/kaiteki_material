import 'package:flutter/material.dart';
import 'package:kaiteki_material/kaiteki_material.dart';

class TextInheritedIconThemePage extends StatelessWidget {
  const TextInheritedIconThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "TextInheritedIconTheme",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 8),
          const Text(
            "The TextInheritedIconTheme widget allows the child to inherit an IconTheme based on the current TextStyle. This is especially useful when pairing them with a TextSpan.",
          ),
          const Divider(height: 32),
          DefaultTextStyle.merge(
            style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Without",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(height: 8),
                        _buildContent(context),
                      ],
                    ),
                  ),
                  const VerticalDivider(width: 32),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "With",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(height: 8),
                        TextInheritedIconTheme(child: _buildContent(context)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text: "There are 3 shapes that everyone should know:",
        children: [
          TextSpan(text: " the "),
          WidgetSpan(child: Icon(Icons.square_outlined)),
          TextSpan(text: " square, "),
          WidgetSpan(child: Icon(Icons.circle_outlined)),
          TextSpan(text: " the circle, and "),
          WidgetSpan(child: Icon(Icons.hexagon_outlined)),
          TextSpan(text: " the hexagon, "),
        ],
      ),
    );
  }
}
