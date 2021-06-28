import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tribes/routing/router.dart';
import 'package:tribes/services/service_locator.dart';

import '../providers/nav_provider.dart';

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
            body: Column(
              children: [
                Flexible(
                  child: Center(
                    child: Text(
                      locator<AppRouterDelegate>().appRoutePath.pathWithQuery,
                    ),
                  ),
                ),
                BottomNavigationBar(
                  selectedItemColor: Color.fromRGBO(0, 76, 186, 1),
                  unselectedItemColor: Color.fromRGBO(136, 136, 136, 1),
                  selectedLabelStyle: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(0, 76, 186, 1),
                    fontWeight: FontWeight.normal,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(136, 136, 136, 1),
                    fontWeight: FontWeight.normal,
                  ),
                  backgroundColor: Color.fromRGBO(1, 0, 25, 1),
                  type: BottomNavigationBarType.fixed,
                  onTap: (index) => provider.setTabIndex(index),
                  currentIndex: tabIndex,
                  items: provider.tabs
                      .map((navTab) => BottomNavigationBarItem(
                          label: navTab.label, icon: navTab.icon))
                      .toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
