import 'package:example/device_frame.dart';
import 'package:flutter/material.dart';

class M1DrawerPage extends StatefulWidget {
  const M1DrawerPage({super.key});

  @override
  State<M1DrawerPage> createState() => _M1DrawerPageState();
}

class _M1DrawerPageState extends State<M1DrawerPage> {
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: DeviceFrame.phone(
          child: MaterialApp(
            theme: ThemeData.from(
              colorScheme: ColorScheme.fromSwatch(
                backgroundColor: Colors.white,
                primarySwatch: Colors.cyan,
                accentColor: Colors.limeAccent,
              ),
              textTheme: Typography.material2014().black,
            ),
            home: Builder(builder: (context) {
              return Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  title: const Text(
                    "Inbox",
                    style: TextStyle(color: Colors.white),
                  ),
                  elevation: 0,
                  actions: [
                    IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: _MailSearchDelegate(),
                        );
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
                drawer: Drawer(
                  child: ListView(
                    children: [
                      const UserAccountsDrawerHeader(
                        currentAccountPicture: CircleAvatar(
                          child: Text(
                            "J",
                            style: TextStyle(
                              fontSize: 32.0,
                            ),
                          ),
                        ),
                        accountEmail: Text(
                          "heyfromjonathan@gmail.com",
                          style: TextStyle(color: Colors.white),
                        ),
                        accountName: Text(
                          "Jonathan Lee",
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/img/m1-header.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.move_to_inbox),
                        title: const Text("Inbox"),
                        onTap: () {},
                        selected: true,
                      ),
                      ListTile(
                        leading: const Icon(Icons.send),
                        title: const Text("Sent"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.delete),
                        title: const Text("Trash"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.report),
                        title: const Text("Spam"),
                        onTap: () {},
                      ),
                      const SizedBox(height: 8),
                      const Divider(
                        thickness: 1,
                        height: 1,
                      ),
                      ListTile(
                        title: Text(
                          "Labels",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!
                                        .withOpacity(.54),
                                  ),
                        ),
                        enabled: false,
                      ),
                      ListTile(
                        leading: const Icon(Icons.label),
                        title: const Text("Family"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.label),
                        title: const Text("Friends"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.label),
                        title: const Text("Work"),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                body: ListView(
                  children: [
                    const ListTile(
                      title: Text("Today"),
                      enabled: false,
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        child: Text("A"),
                      ),
                      title: const Text("Brunch this weekend?"),
                      subtitle: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Ali Connors",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const TextSpan(
                                text:
                                    " — I'll be in your neighborhood doing errands this weekend."),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Divider(indent: 68, height: 1, thickness: 1),
                    ListTile(
                      leading: const CircleAvatar(
                        child: Text("B"),
                      ),
                      title: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: "Summer BBQ"),
                            TextSpan(
                              text: " 4",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "to Alex, Scott, Jennifer",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const TextSpan(
                              text:
                                  " — Wish I could come, but I'm out of town this weekend.",
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Divider(indent: 68, height: 1, thickness: 1),
                    ListTile(
                      leading: const CircleAvatar(
                        child: Text("C"),
                      ),
                      title: const Text("Oui oui"),
                      subtitle: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Sandra Adams",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const TextSpan(
                              text:
                                  " — Do you have Paris recommendations? Have you ever been?",
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Divider(indent: 68, height: 1, thickness: 1),
                    ListTile(
                      leading: const CircleAvatar(
                        child: Text("D"),
                      ),
                      title: const Text("Birthday gift"),
                      subtitle: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Trevor Hansen",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const TextSpan(
                              text:
                                  " — Have any ideas about what we should get Heidi for her birthday?",
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Divider(indent: 68, height: 1, thickness: 1),
                    ListTile(
                      leading: const CircleAvatar(
                        child: Text("E"),
                      ),
                      title: const Text("Recipe to try"),
                      subtitle: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Britta Holt",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const TextSpan(
                              text:
                                  " — We should eat this: Grate, Squash, Corn, and tomatillo Tacos.",
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Divider(indent: 68, height: 1, thickness: 1),
                    ListTile(
                      leading: const CircleAvatar(
                        child: Text("F"),
                      ),
                      title: const Text("Giants game"),
                      subtitle: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "David Park",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const TextSpan(
                              text:
                                  " — Any interest in seeing the Giants game tomorrow?",
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _MailSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) => null;

  @override
  Widget buildResults(BuildContext context) => const SizedBox();

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 8),
        ListTile(
          leading: Icon(Icons.schedule),
          title: Text("itinerary"),
        ),
        ListTile(
          leading: Icon(Icons.schedule),
          title: Text("birthday"),
        ),
        ListTile(
          leading: Icon(Icons.schedule),
          title: Text("adam"),
        ),
        ListTile(
          leading: Icon(Icons.schedule),
          title: Text("confirmation"),
        ),
      ],
    );
  }
}
