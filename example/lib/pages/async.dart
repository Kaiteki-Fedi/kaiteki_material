import 'package:flutter/material.dart';
import 'package:kaiteki_material/kaiteki_material.dart';

class AsyncPage extends StatelessWidget {
  const AsyncPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              Tab(text: "AsyncButton"),
              Tab(text: "AsyncBlockWidget"),
            ],
          ),
          const Divider(height: 1),
          Expanded(
            child: TabBarView(
              children: [
                Center(
                  child: AsyncButton(
                    child: const Text("Click me"),
                    onPressed: () => Future.delayed(const Duration(seconds: 5)),
                  ),
                ),
                _AsyncBlockWidgetExample(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AsyncBlockWidgetExample extends StatefulWidget {
  @override
  State<_AsyncBlockWidgetExample> createState() =>
      _AsyncBlockWidgetExampleState();
}

class _AsyncBlockWidgetExampleState extends State<_AsyncBlockWidgetExample> {
  bool _blocked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: 256,
        child: Card(
          child: AsyncBlockWidget(
            duration: const Duration(milliseconds: 250),
            secondChild: const Center(child: CircularProgressIndicator()),
            blocking: _blocked,
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  setState(() => _blocked = true);
                  await Future.delayed(const Duration(seconds: 5));
                  setState(() => _blocked = false);
                },
                child: const Text("Click me"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
