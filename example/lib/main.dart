import 'package:example/library_logo.dart';
import 'package:example/pages/async.dart';
import 'package:example/pages/m1/bottom_navigation.dart';
import 'package:example/pages/m1/drawer.dart';
import 'package:example/pages/m1/main_switch_list_tile.dart';
import 'package:example/pages/m2/drawer.dart';
import 'package:example/pages/m2/main_switch_list_tile.dart';
import 'package:example/pages/m3/drawer.dart';
import 'package:example/pages/m3/main_switch_list_tile.dart';
import 'package:example/pages/text_inherited_icon_theme.dart';
import 'package:example/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:kaiteki_material/kaiteki_material.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => ExampleAppState();
}

class ExampleAppState extends State<ExampleApp> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      themeMode: _themeMode,
      home: const MainScreen(),
    );
  }

  void toggleThemeMode() {
    setState(() {
      if (_themeMode == ThemeMode.dark) {
        _themeMode = ThemeMode.light;
      } else {
        _themeMode = ThemeMode.dark;
      }
    });
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

typedef WidgetInstantiator<T extends Widget> = T Function();

class _MainScreenItem<T extends Widget> {
  final IconData icon;
  final String title;
  final WidgetInstantiator<T> instantiator;

  bool matchesType(Widget? widget) => widget is T;

  const _MainScreenItem(this.icon, this.title, this.instantiator);
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int _materialVersion = 3;
  Widget? _currentPage;
  String? _currentTitle;

  void _changePage(_MainScreenItem item) {
    setState(() {
      _currentPage = item.instantiator();
      _currentTitle = item.title;
    });

    _scaffoldKey.currentState?.closeDrawer();
  }

  List<_MainScreenItem> get _mdPages {
    switch (_materialVersion) {
      case 1:
        return [
          const _MainScreenItem<M1DrawerPage>(
            Icons.menu_rounded,
            "Drawers",
            M1DrawerPage.new,
          ),
          const _MainScreenItem<M1MainSwitchListTile>(
            Icons.toggle_on_rounded,
            "MainSwitchListTile",
            M1MainSwitchListTile.new,
          ),
          const _MainScreenItem<M1BottomNavigation>(
            Icons.more_horiz,
            "Bottom navigation",
            M1BottomNavigation.new,
          ),
        ];

      case 2:
        return [
          const _MainScreenItem<M2DrawerPage>(
            Icons.menu_rounded,
            "Drawers",
            M2DrawerPage.new,
          ),
          const _MainScreenItem<M2MainSwitchListTile>(
            Icons.toggle_on_rounded,
            "MainSwitchListTile",
            M2MainSwitchListTile.new,
          ),
        ];

      case 3:
        return [
          const _MainScreenItem<M3DrawerPage>(
            Icons.menu_rounded,
            "Drawers",
            M3DrawerPage.new,
          ),
          const _MainScreenItem<M3MainSwitchListTile>(
            Icons.toggle_on_rounded,
            "MainSwitchListTile",
            M3MainSwitchListTile.new,
          ),
        ];

      default:
        throw StateError("Invalid material version: $_materialVersion");
    }
  }

  @override
  Widget build(BuildContext context) {
    final mdPages = _mdPages;
    return LayoutBuilder(builder: (context, constraints) {
      bool isDesktop = constraints.maxWidth >= 1240;

      var materialVersionDropDown = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: DropdownButton(
          value: _materialVersion,
          items: [
            for (var i = 1; i < 4; i++)
              DropdownMenuItem(
                value: i,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text("Material Design $i"),
                ),
              ),
          ],
          onChanged: (i) {
            if (i == null) return;
            _materialVersion = i;

            final updatedPages = _mdPages;
            final j = updatedPages.indexWhere((e) => e.title == _currentTitle);
            if (j != -1) {
              _changePage(updatedPages[j]);
            } else {
              setState(() {});
            }
          },
          itemHeight: 56.0,
          icon: const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.arrow_drop_down),
          ),
          style: Theme.of(context).textTheme.labelLarge,
          isExpanded: true,
          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(28.0),
        ),
      );

      final drawer = Drawer(
        child: ListView(
          children: [
            DrawerListTile(
              contentPadding: const EdgeInsets.only(right: -4.0),
              title: const LibraryLogo(),
              trailing: IconButton(
                onPressed: () {
                  context
                      .findAncestorStateOfType<ExampleAppState>()!
                      .toggleThemeMode();
                },
                icon: Theme.of(context).brightness == Brightness.dark
                    ? const Icon(Icons.wb_sunny)
                    : const Icon(Icons.nightlight_round),
              ),
            ),
            DrawerListTile(
              leading: const Icon(Icons.home_rounded),
              title: const Text("Welcome"),
              selected: _currentPage == null || _currentPage is WelcomePage,
              onTap: () => _changePage(
                _MainScreenItem(
                  Icons.home_rounded,
                  "Welcome",
                  () => const WelcomePage(),
                ),
              ),
            ),
            const Divider(height: 1, thickness: 1),
            materialVersionDropDown,
            for (final page in mdPages)
              DrawerListTile(
                leading: Icon(page.icon),
                title: Text(page.title),
                selected: page.matchesType(_currentPage),
                onTap: () => _changePage(page),
              ),
            const Divider(height: 1, thickness: 1),
            const DrawerListTile(title: Text("Utilities")),
            DrawerListTile(
              leading: const Icon(Icons.import_export_rounded),
              title: const Text("Async"),
              selected: _currentPage.runtimeType == AsyncPage,
              onTap: () => setState(() => _currentPage = const AsyncPage()),
            ),
            DrawerListTile(
              leading: const Icon(Icons.format_color_fill_rounded),
              title: const Text("TextInheritedIconTheme"),
              selected: _currentPage.runtimeType == TextInheritedIconThemePage,
              onTap: () => setState(
                  () => _currentPage = const TextInheritedIconThemePage()),
            ),
          ],
        ),
      );

      final body = _currentPage ?? const WelcomePage();

      if (isDesktop) {
        return Scaffold(
          key: _scaffoldKey,
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isDesktop) SizedBox(width: 360, child: drawer),
              Expanded(child: body),
            ],
          ),
        );
      }

      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: const LibraryLogo()),
        drawer: drawer,
        body: body,
      );
    });
  }
}
