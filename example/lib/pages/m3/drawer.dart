import 'package:example/content_with_description.dart';
import 'package:example/device_frame.dart';
import 'package:example/markdown_side_panel.dart';
import 'package:flutter/material.dart';
import 'package:kaiteki_material/kaiteki_material.dart';

class M3DrawerPage extends StatefulWidget {
  const M3DrawerPage({super.key});

  @override
  State<M3DrawerPage> createState() => _M3DrawerPageState();
}

class _M3DrawerPageState extends State<M3DrawerPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scaffoldKey.currentState!.openDrawer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ContentWithDescription(
      description: const MarkdownSidePanel(assetPath: "assets/md/m3/drawer.md"),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DeviceFrame.phone(
          child: Theme(
            data: ThemeData.from(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.purple,
                brightness: Theme.of(context).brightness,
              ),
              useMaterial3: true,
            ),
            child: DividerTheme(
              data: drawerDividerTheme,
              child: Builder(builder: (context) {
                return Scaffold(
                  key: _scaffoldKey,
                  appBar: AppBar(),
                  drawer: Drawer(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                      ),
                    ),
                    child: ListView(
                      children: [
                        DrawerListTile(
                          title: Text(
                            "Mail",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        DrawerListTile(
                          leading: const Icon(Icons.inbox),
                          title: const Text("Inbox"),
                          onTap: () {},
                          trailing: const Text("24"),
                          selected: true,
                        ),
                        DrawerListTile(
                          leading: const Icon(Icons.send_outlined),
                          title: const Text("Outbox"),
                          trailing: const Text("100+"),
                          onTap: () {},
                        ),
                        DrawerListTile(
                          leading: const Icon(Icons.favorite_outline),
                          title: const Text("Favorites"),
                          onTap: () {},
                        ),
                        DrawerListTile(
                          leading: const Icon(Icons.delete_outline),
                          title: const Text("Trash"),
                          onTap: () {},
                        ),
                        const Divider(),
                        DrawerListTile(
                          title: Text(
                            "Labels",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        DrawerListTile(
                          leading: const Icon(Icons.bookmark),
                          title: const Text("Family"),
                          onTap: () {},
                        ),
                        DrawerListTile(
                          leading: const Icon(Icons.bookmark),
                          title: const Text("Friends"),
                          onTap: () {},
                        ),
                        DrawerListTile(
                          leading: const Icon(Icons.bookmark),
                          title: const Text("Work"),
                          onTap: () {},
                        ),
                        const Divider(),
                        DrawerListTile(
                          leading: const Icon(Icons.settings),
                          title: const Text("Settings"),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
