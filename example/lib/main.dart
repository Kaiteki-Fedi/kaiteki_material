import 'package:example/drawer.dart';
import 'package:example/pages/async.dart';
import 'package:example/pages/badges.dart';
import 'package:example/pages/main_switch_list_tile.dart';
import 'package:example/pages/tabs.dart';
import 'package:example/pages/text_inherited_icon_theme.dart';
import 'package:example/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const MainScreen(),
    ),
  );
}

class LibraryLogo extends StatelessWidget {
  const LibraryLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Kaiteki",
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(text: " Material"),
        ],
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isDesktop = constraints.maxWidth >= 1240;

      const pages = [
        WelcomePage(),
        BadgesPage(),
        TabsPage(),
        AsyncPage(),
        MainSwitchListTilePage(),
        TextInheritedIconThemePage(),
      ];

      final drawer = MainScreenDrawer(
        header: isDesktop ? const LibraryLogo() : null,
        selectedIndex: _selectedIndex,
        onItemSelected: (value) {
          setState(() => _selectedIndex = value);
          if (!isDesktop) Navigator.of(context).pop();
        },
        items: [
          MainScreenDrawerItem(
            Icons.home_rounded,
            "Welcome",
            pages.indexWhere((e) => e is WelcomePage),
          ),
          const MainScreenDrawerItem.section("Material 3"),
          MainScreenDrawerItem(
            Icons.looks_one_rounded,
            "Badges",
            pages.indexWhere((e) => e is BadgesPage),
          ),
          MainScreenDrawerItem(
            Icons.tab_rounded,
            "Tabs",
            pages.indexWhere((e) => e is TabsPage),
          ),
          const MainScreenDrawerItem.section("Material 2"),
          MainScreenDrawerItem(
            Icons.toggle_on_rounded,
            "MainSwitchListTile",
            pages.indexWhere((e) => e is MainSwitchListTilePage),
          ),
          const MainScreenDrawerItem.section("Utilities"),
          MainScreenDrawerItem(
            Icons.import_export_rounded,
            "Async",
            pages.indexWhere((e) => e is AsyncPage),
          ),
          MainScreenDrawerItem(
            Icons.format_color_fill_rounded,
            "TextInheritedIconTheme",
            pages.indexWhere((e) => e is TextInheritedIconThemePage),
          ),
        ],
      );

      final body = IndexedStack(index: _selectedIndex, children: pages);

      if (isDesktop) {
        return Scaffold(
          body: Row(
            children: [
              if (isDesktop) SizedBox(width: 360, child: drawer),
              Expanded(child: body),
            ],
          ),
        );
      }

      return Scaffold(
        appBar: AppBar(title: const LibraryLogo()),
        drawer: drawer,
        body: body,
      );
    });
  }
}
