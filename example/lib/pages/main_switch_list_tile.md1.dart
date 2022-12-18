import 'package:flutter/material.dart';
import 'package:kaiteki_material/kaiteki_material.dart';

class MD1Example extends StatelessWidget {
  final bool enabled;
  final ValueChanged<bool> onChanged;

  const MD1Example({
    super.key,
    required this.enabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text("Wi-Fi"),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
        backgroundColor: const Color(0xFF263238),
        foregroundColor: const Color(0xFFFFFFFF),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainSwitchListTile(
              onChanged: onChanged,
              value: enabled,
              title: Text(
                enabled ? "On" : "Off",
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
  }
}
