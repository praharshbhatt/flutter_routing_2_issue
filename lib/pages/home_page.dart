import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tribes/routing/router.dart';
import 'package:tribes/services/service_locator.dart';
import 'package:tribes/widgets/navigation/hyper_drawer.dart';

import '../providers/nav_provider.dart';
import '../utils/color.dart';
import '../utils/font.dart';
import '../widgets/device.dart';
import '../widgets/navigation/drawer/hypr_drawer.dart';
import '../widgets/navigation/hypr_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.tabIndex, this.screen);

  final int tabIndex;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;

    return Consumer<NavProvider>(
      builder: (context, provider, child) {
        return WillPopScope(
          onWillPop: () async => provider.onWillPop(context),
          // Bottom Nav And/Or App Bar to be owned by this scaffold..
          child: Scaffold(
            drawer: const HyprDrawer(),
            body: Column(
              children: [
                Visibility(
                  visible: _screenSize.width > 800,
                  child: Container(
                    decoration: const BoxDecoration(color: topAppBarBackground),
                    child: HyperNavBar(
                      tabMenu: HyprAppBarTabMenu(
                        currentTab: provider.tabs[tabIndex].label,
                        items: provider.tabs,
                        onSelectTab: (tabName) => provider.setTab(tabName),
                      ),
                    ),
                  ),
                ),
                //Flexible(child: screen),
                Flexible(
                  child: Center(
                    child: Text(
                      locator<AppRouterDelegate>().appRoutePath.pathWithQuery,
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: getScreenType(context) == DeviceType.phone
                ? BottomNavigationBar(
                    selectedItemColor: themeBlue,
                    unselectedItemColor: themeMediumDarkGrey,
                    selectedLabelStyle: selectedLabelStyle,
                    unselectedLabelStyle: unselectedLabelStyle,
                    backgroundColor: themeDarkBlue,
                    type: BottomNavigationBarType.fixed,
                    onTap: (index) => provider.setTabIndex(index),
                    currentIndex: tabIndex,
                    items: provider.tabs
                        .map((navTab) => BottomNavigationBarItem(
                            label: navTab.label, icon: navTab.icon))
                        .toList(),
                  )
                : null,
          ),
        );
      },
    );
  }
}
