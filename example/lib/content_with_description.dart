import 'package:flutter/material.dart';

class ContentWithDescription extends StatelessWidget {
  final Widget child;
  final Widget description;

  const ContentWithDescription({
    super.key,
    required this.description,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 800) {
          return Row(
            children: [
              Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 350,
                  ),
                  child: description,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Center(child: child),
              ),
            ],
          );
        } else {
          return DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor:
                      Theme.of(context).colorScheme.onSurfaceVariant,
                  tabs: const [
                    Tab(text: "Description"),
                    Tab(text: "Demonstration"),
                  ],
                ),
                const Divider(height: 1),
                Expanded(
                  child: TabBarView(
                    children: [
                      description,
                      Center(child: child),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
