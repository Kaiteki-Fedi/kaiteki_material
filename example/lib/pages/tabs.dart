import 'package:example/device_frame.dart';
import 'package:example/themes.dart';
import 'package:flutter/material.dart';
import 'package:kaiteki_material/kaiteki_material.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: mdGreenLight,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: DeviceFrame.phone(
            child: const MDTabsExample(),
          ),
        ),
      ),
    );
  }
}

class MDTabsExample extends StatelessWidget {
  const MDTabsExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text("My saved media"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.attach_file),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.today),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
          bottom: TabBar(
            indicator: RoundedUnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor:
                Theme.of(context).colorScheme.onSurfaceVariant,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [
              Tab(
                icon: Icon(Icons.videocam_outlined),
                text: "Video",
              ),
              Tab(
                icon: Icon(Icons.photo_outlined),
                text: "Photos",
              ),
              Tab(
                icon: Icon(Icons.music_note),
                text: "Audio",
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const Divider(height: 1),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.zero,
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ColoredBox(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.45 / 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
