import 'package:example/device_frame.dart';
import 'package:example/pages/main_switch_list_tile.md1.dart';
import 'package:example/pages/main_switch_list_tile.md2.dart';
import 'package:example/pages/main_switch_list_tile.md3.dart';
import 'package:flutter/material.dart';

class MainSwitchListTilePage extends StatefulWidget {
  const MainSwitchListTilePage({super.key});

  @override
  State<MainSwitchListTilePage> createState() => _MainSwitchListTilePageState();
}

class _MainSwitchListTilePageState extends State<MainSwitchListTilePage> {
  bool _enabled = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Theme.of(context).colorScheme.primary,
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor:
                Theme.of(context).colorScheme.onSurfaceVariant,
            tabs: const [
              Tab(text: "MD 1"),
              Tab(text: "MD 2"),
              Tab(text: "MD 3"),
            ],
          ),
          const Divider(height: 1),
          Expanded(
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: DeviceFrame.phone(
                      child: Theme(
                        data: ThemeData.from(
                          colorScheme:
                              Theme.of(context).brightness == Brightness.light
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
                        child: MD1Example(
                          enabled: _enabled,
                          onChanged: _onChanged,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: DeviceFrame.phone(
                      child: Theme(
                        data: ThemeData.from(
                          colorScheme:
                              Theme.of(context).brightness == Brightness.light
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
                        child: MD2Example(
                          enabled: _enabled,
                          onChanged: _onChanged,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: DeviceFrame.phone(
                      child: MD3Example(
                        enabled: _enabled,
                        onChanged: _onChanged,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onChanged(value) {
    setState(() => _enabled = value);
  }
}
