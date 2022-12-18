import 'package:flutter/material.dart';

const _horizontalPadding = 28.0;
const _activeIndicatorHeight = 56.0;

class MainScreenDrawer extends StatelessWidget {
  final int? selectedIndex;
  final ValueChanged<int> onItemSelected;
  final Widget? header;
  final List<MainScreenDrawerItem> items;

  const MainScreenDrawer({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    this.header,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final itemTextStyle = Theme.of(context).textTheme.labelLarge;
    // final widgetNameTextStyle = GoogleFonts.robotoMono().copyWith(
    //   fontSize: itemTextStyle?.fontSize,
    //   fontWeight: itemTextStyle?.fontWeight,
    // );

    final divider = Divider(
      height: 1,
      color: Theme.of(context).colorScheme.outline,
      indent: _horizontalPadding - 12,
      endIndent: _horizontalPadding - 12,
    );

    return Drawer(
      child: ListTileTheme.merge(
        selectedTileColor: Theme.of(context).colorScheme.secondaryContainer,
        contentPadding: const EdgeInsets.fromLTRB(16, 4, 24, 4),
        minLeadingWidth: 12,
        shape: const StadiumBorder(),
        child: DefaultTextStyle.merge(
          style: itemTextStyle,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              if (header != null)
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: _activeIndicatorHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: header!,
                    ),
                  ),
                ),
              for (final item in items)
                if (item.index == null) ...[
                  divider,
                  ListTile(
                    title: Text(item.text, style: itemTextStyle),
                  )
                ] else
                  ListTile(
                    leading: Icon(
                      item.icon!,
                      color: selectedIndex == item.index
                          ? Theme.of(context).colorScheme.onSecondaryContainer
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    title: Text(item.text, style: itemTextStyle),
                    selected: selectedIndex == item.index,
                    onTap: () => onItemSelected(item.index!),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

@immutable
class MainScreenDrawerItem {
  final IconData? icon;
  final String text;
  final int? index;

  const MainScreenDrawerItem(IconData this.icon, this.text, this.index);
  const MainScreenDrawerItem.section(this.text)
      : icon = null,
        index = null;
}
