import 'package:flutter/material.dart';

import '../../providers/nav_provider.dart';
import '../../utils/color.dart';

class HyprAppBarTabMenu extends StatelessWidget {
   const HyprAppBarTabMenu({required this.currentTab, required this.items, required this.onSelectTab});

  final ValueChanged<String> onSelectTab;
  final List<NavTab> items;
  final String currentTab;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items
          .map(
            (navTab) => Container(
              width: 65,
              height: Size.infinite.height,
              decoration: currentTab ==
                  navTab.rootName ? BoxDecoration(
                  color: themeBoxBlue.withOpacity(0.3),
                  border:
                      const Border(bottom: BorderSide(width: 2, color: themeBlue))) : null,
              child: IconButton(
                onPressed: () =>
                    {onSelectTab(navTab.rootName)},
                icon: navTab.icon,
                color: currentTab ==
                        navTab.rootName
                    ? themeHighlightGreen
                    : Colors.white,
              ),
            ),
          )
          .toList(),
    );
  }
}

