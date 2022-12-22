import 'package:example/content_with_description.dart';
import 'package:example/device_frame.dart';
import 'package:example/markdown_side_panel.dart';
import 'package:example/mock_data.dart';
import 'package:example/themes.dart';
import 'package:flutter/material.dart';
import 'package:kaiteki_material/kaiteki_material.dart';

class M2DrawerPage extends StatefulWidget {
  const M2DrawerPage({super.key});

  @override
  State<M2DrawerPage> createState() => _M2DrawerPageState();
}

class _M2DrawerPageState extends State<M2DrawerPage> {
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
    const divider = Divider(
      height: 17,
      thickness: 1,
      indent: 8 * 8.5,
    );
    return ContentWithDescription(
      description: const SizedBox(
        width: 300,
        child: MarkdownSidePanel(
          assetPath: "assets/md/m2/drawer.md",
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: DeviceFrame.phone(
            child: Theme(
              data: md2baseline,
              child: Builder(builder: (context) {
                return Scaffold(
                  key: _scaffoldKey,
                  appBar: AppBar(
                    title: const Text("Inbox"),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                      PopupMenuButton(
                        itemBuilder: (_) => [],
                      ),
                    ],
                  ),
                  drawer: Drawer(
                    child: ListView(
                      children: [
                        DrawerListTile(
                          leading: const Icon(Icons.mail),
                          title: const Text("Inbox"),
                          onTap: () {},
                          selected: true,
                        ),
                        DrawerListTile(
                          leading: const Icon(Icons.send),
                          title: const Text("Outbox"),
                          onTap: () {},
                        ),
                        DrawerListTile(
                          leading: const Icon(Icons.favorite),
                          title: const Text("Favorites"),
                          onTap: () {},
                        ),
                        DrawerListTile(
                          leading: const Icon(Icons.archive),
                          title: const Text("Archived"),
                          onTap: () {},
                        ),
                        DrawerListTile(
                          leading: const Icon(Icons.delete),
                          title: const Text("Trash"),
                          onTap: () {},
                        ),
                        DrawerListTile(
                          leading: const Icon(Icons.report),
                          title: const Text("Spam"),
                          onTap: () {},
                        ),
                        const Divider(),
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
                          title: const Text("Settings & account"),
                          onTap: () {},
                        ),
                        DrawerListTile(
                          leading: const Icon(Icons.feedback),
                          title: const Text("Help & feedback"),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  body: ListView(
                    children: [
                      const ListTile(title: Text("Today")),
                      for (var email in exampleEmails) ...[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(email.sender[0].toUpperCase()),
                          ),
                          title: Text(email.subject),
                          subtitle: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: email.sender,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                                TextSpan(text: " — ${email.body}"),
                              ],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        divider,
                      ],
                    ],
                  ),
                  floatingActionButton: FloatingActionButton(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    onPressed: () {},
                    child: const Icon(Icons.add),
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
