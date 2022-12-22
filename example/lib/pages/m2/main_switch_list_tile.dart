import 'package:example/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:kaiteki_material/kaiteki_material.dart';

class M2MainSwitchListTile extends StatefulWidget {
  const M2MainSwitchListTile({super.key});

  @override
  State<M2MainSwitchListTile> createState() => _M2MainSwitchListTileState();
}

class _M2MainSwitchListTileState extends State<M2MainSwitchListTile> {
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
                      primary: Color(0xFF448AFF),
                      onPrimary: Color(0xFFFFFFFF),
                      secondary: Color(0xFF448AFF),
                      onSecondary: Color(0xFFFFFFFF),
                    )
                  : const ColorScheme.dark(
                      background: Color(0xFF212121),
                      primary: Color(0xFF448AFF),
                      onPrimary: Color(0xFFFFFFFF),
                      secondary: Color(0xFF448AFF),
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
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ],
                  elevation: 0,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  foregroundColor: Theme.of(context).colorScheme.onBackground,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      MainSwitchListTile(
                        onChanged: (value) => setState(() => _enabled = value),
                        value: _enabled,
                        title: Text(
                          "Use Wi-Fi",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: _enabled
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context)
                                    .colorScheme
                                    .onInverseSurface,
                          ),
                        ),
                        tileColor: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(0x73),
                        contentPadding: const EdgeInsets.only(left: 54.0),
                      ),
                      ListTile(
                        leading: const Icon(Icons.signal_wifi_4_bar),
                        title: const Text("Home Wi-Fi"),
                        subtitle: const Text("Connected"),
                        trailing: Icon(
                          Icons.settings_outlined,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const Divider(height: 1),
                      for (var i = 0; i < 3; i++)
                        ListTile(
                          leading: const Icon(Icons.signal_wifi_4_bar),
                          title: Text("Wi-Fi $i"),
                          trailing: const Icon(Icons.lock_outline),
                        ),
                      ListTile(
                        leading: const Icon(Icons.add),
                        title: const Text("Add network"),
                        trailing: Icon(
                          Icons.qr_code,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const Divider(height: 1),
                      const ListTile(
                        leading: SizedBox(),
                        title: Text("Wi-Fi preferences"),
                        subtitle: Text("Wi-Fi turns back on automatically"),
                      ),
                      const ListTile(
                        leading: SizedBox(),
                        title: Text("Saved networks"),
                        subtitle: Text("1 network"),
                      ),
                      const ListTile(
                        leading: SizedBox(),
                        title: Text("Wi-Fi data usage"),
                        subtitle: Text("5 GB used Jan 1 - Feb 1"),
                      ),
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
