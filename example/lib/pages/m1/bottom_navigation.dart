import 'package:example/device_frame.dart';
import 'package:flutter/material.dart';

class M1BottomNavigation extends StatefulWidget {
  const M1BottomNavigation({super.key});

  @override
  State<M1BottomNavigation> createState() => _M1BottomNavigationState();
}

class _M1BottomNavigationState extends State<M1BottomNavigation> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DeviceFrame.phone(
          child: MaterialApp(
            home: Scaffold(
              backgroundColor: Colors.grey.shade100,
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex,
                unselectedItemColor: Colors.white.withOpacity(.54),
                onTap: (i) => setState(() => _currentIndex = i),
                items: [
                  BottomNavigationBarItem(
                    backgroundColor: Colors.blueGrey.shade700,
                    icon: const Icon(Icons.ondemand_video),
                    label: "Movies & TV",
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.teal.shade600,
                    icon: const Icon(Icons.music_note),
                    label: "Music",
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.brown.shade400,
                    icon: const Icon(Icons.book),
                    label: "Books",
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.brown.shade600,
                    icon: const Icon(Icons.newspaper),
                    label: "Newsstand",
                  ),
                ],
              ),
              body: Column(
                children: [
                  Card(
                    margin: const EdgeInsets.all(8),
                    child: Row(children: [
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(Icons.menu),
                      ),
                      const SizedBox(width: 24),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                          ),
                        ),
                      ),
                      PopupMenuButton(itemBuilder: (_) => []),
                      const SizedBox(width: 8),
                    ]),
                  ),
                  Expanded(
                    child: IndexedStack(
                      index: _currentIndex,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "New Releases",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text("MORE"),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  for (var i = 0; i < 2; i++)
                                    Expanded(
                                      child: Card(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const AspectRatio(
                                              aspectRatio: 1,
                                              child: Placeholder(),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Title",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle1,
                                                  ),
                                                  const SizedBox(height: 8),
                                                  const Text("Genre"),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Placeholder(),
                        SingleChildScrollView(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              for (var i = 0; i < 5; i++)
                                Card(
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 100,
                                          child: AspectRatio(
                                            aspectRatio: 11 / 16,
                                            child: Placeholder(),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Title",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5,
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    "Author",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              height: 1,
                                              thickness: 1,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: const Text(
                                                        "FREE SAMPLE"),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: const Text("REVIEW"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const Placeholder(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
