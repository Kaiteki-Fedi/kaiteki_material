import 'package:example/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:kaiteki_material/kaiteki_material.dart';

class M3MainSwitchListTile extends StatefulWidget {
  const M3MainSwitchListTile({super.key});

  @override
  State<M3MainSwitchListTile> createState() => _M3MainSwitchListTileState();
}

class _M3MainSwitchListTileState extends State<M3MainSwitchListTile> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: DeviceFrame.phone(
            child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
                title: const Text("Wi-Fi"),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                      child: MainSwitchListTile(
                        onChanged: (value) => setState(() => _enabled = value),
                        value: _enabled,
                        title: const Text("Use Wi-Fi"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(
                          8.0,
                          8.0,
                          -8.0,
                          8.0,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.signal_wifi_4_bar,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      title: const Text("Home Wi-Fi"),
                      subtitle: const Text("Connected"),
                      trailing: Icon(
                        Icons.settings_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    for (var i = 0; i < 3; i++)
                      ListTile(
                        leading: const Icon(Icons.signal_wifi_4_bar),
                        title: Text("Wi-Fi $i"),
                        trailing: const Icon(Icons.lock_outline),
                      ),
                    const Divider(height: 1),
                    const ListTile(
                      title: Text("Wi-Fi preferences"),
                      subtitle: Text("Wi-Fi turns back on automatically"),
                    ),
                    const ListTile(
                      title: Text("Saved networks"),
                      subtitle: Text("1 network"),
                    ),
                    const ListTile(
                      title: Text("Wi-Fi data usage"),
                      subtitle: Text("5 GB used Jan 1 - Feb 1"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
