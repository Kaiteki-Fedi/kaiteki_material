import 'package:example/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:kaiteki_material/kaiteki_material.dart';

class M1MainSwitchListTile extends StatefulWidget {
  const M1MainSwitchListTile({super.key});

  @override
  State<M1MainSwitchListTile> createState() => _M1MainSwitchListTileState();
}

class _M1MainSwitchListTileState extends State<M1MainSwitchListTile> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: DeviceFrame.phone(
          child: Theme(
            data: ThemeData.from(
              colorScheme: Theme.of(context).brightness == Brightness.light
                  ? const ColorScheme.light(
                      background: Color(0xFFFFFFFF),
                      primary: Color(0xFF009587),
                      onPrimary: Color(0xFFFFFFFF),
                      secondary: Color(0xFF7CC6BF),
                      onSecondary: Color(0xFFFFFFFF),
                    )
                  : const ColorScheme.dark(
                      background: Color(0xFF242424),
                      primary: Color(0xFF7CC6BF),
                      onPrimary: Color(0xFFFFFFFF),
                      secondary: Color(0xFF7CC6BF),
                      onSecondary: Color(0xFFFFFFFF),
                    ),
              useMaterial3: false,
            ),
            child: Builder(builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                  title: const Text("Wi-Fi"),
                  actions: [
                    IconButton(
                        icon: const Icon(Icons.search), onPressed: () {}),
                    IconButton(
                        icon: const Icon(Icons.more_vert), onPressed: () {}),
                  ],
                  backgroundColor: const Color(0xFF263238),
                  foregroundColor: const Color(0xFFFFFFFF),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      MainSwitchListTile(
                        onChanged: (value) => setState(() => _enabled = value),
                        value: _enabled,
                        title: Text(
                          _enabled ? "On" : "Off",
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        tileColor: const Color(0xFF37474F),
                        activeTileColor: const Color(0xFF37474F),
                        contentPadding: const EdgeInsets.only(left: 54.0),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.signal_wifi_4_bar,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: const Text("Home Wi-Fi"),
                        subtitle: const Text("Connected"),
                      ),
                      for (var i = 0; i < 3; i++) ...[
                        const Divider(height: 1),
                        ListTile(
                          leading: Icon(
                            Icons.signal_wifi_4_bar,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: Text("Wi-Fi $i"),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
