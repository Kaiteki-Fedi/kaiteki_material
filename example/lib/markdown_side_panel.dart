import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownSidePanel extends StatefulWidget {
  final String assetPath;

  const MarkdownSidePanel({super.key, required this.assetPath});

  @override
  State<MarkdownSidePanel> createState() => _MarkdownSidePanelState();
}

class _MarkdownSidePanelState extends State<MarkdownSidePanel> {
  Future<String>? _future;

  @override
  void initState() {
    super.initState();
    _future = DefaultAssetBundle.of(context).loadString(widget.assetPath);
  }

  @override
  void didUpdateWidget(MarkdownSidePanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assetPath != widget.assetPath) {
      _future = DefaultAssetBundle.of(context).loadString(widget.assetPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasError) throw snapshot.error!;

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        return Markdown(data: snapshot.data!);
      },
    );
  }
}
