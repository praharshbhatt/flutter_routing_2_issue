import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../routing/route_names.dart';
import '../routing/router.dart';
import '../services/service_locator.dart';

class NavTab {
  NavTab({required this.rootName, required this.label, required this.icon});

  final String rootName;
  final String label;
  final Widget icon;
}

class NavProvider extends ChangeNotifier {
  NavProvider(Map<String, NavTab> tabs) {
    int index = 0;
    _tabs.addAll(tabs);
    _tabs.forEach((key, _) {
      _tabIndex[key] = index++;
    });
    _currentTab = _tabs.keys.first;
  }

  String _currentTab = '';
  final Map<String, int> _tabIndex = {};
  final Map<String, NavTab> _tabs = {};

  int get currentTabIndex => _tabIndex[_currentTab] ?? 0;

  List<NavTab> get tabs => _tabs.values.toList();

  void setTabIndex(int index) {
    final tabName = _tabs.keys.elementAt(index);
    setTab(tabName);
  }

  void setTab(String tabName) {
    locator<AppRouterDelegate>().goToSimplePage(tabName);
    _currentTab = tabName;
    notifyListeners();
  }

  Future<bool> onWillPop(BuildContext context) async {
    // final navState = locator<NavigationService>().navigatorKey.currentState;
    // final navState = _tabs[_currentTab]?.navigatorState.currentState;
    if (_currentTab != _tabs.keys.first) {
      // If the user is at the root of the nav stack
      // and they are not on the first stack, move to the first stack
      setTabIndex(0);
      notifyListeners();
      return false;
    }
    return true;
  }
}

final Map<String, NavTab> globalNavigationTabs = {
  RouteNames.discoverTabRoute: NavTab(
    rootName: RouteNames.discoverTabRoute,
    label: 'discovery'.tr,
    icon: const Icon(Icons.home),
  ),
  RouteNames.tribesTabRoute: NavTab(
    rootName: RouteNames.tribesTabRoute,
    label: 'tribes'.tr,
    icon: const Icon(Icons.collections),
  ),
  RouteNames.musicTabRoute: NavTab(
    rootName: RouteNames.musicTabRoute,
    label: 'music'.tr,
    icon: const Icon(Icons.music_note),
  ),
  RouteNames.movementsTabRoute: NavTab(
    rootName: RouteNames.movementsTabRoute,
    label: 'movements'.tr,
    icon: const Icon(Icons.add),
  ),
};
