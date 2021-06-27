import 'package:flutter/material.dart';

import '../device.dart';
import 'drawer/drawer_button.dart';
import 'hypr_navigation_bar.dart';
import 'navbar_item.dart';
import 'navbar_logo_item.dart';


class HyperNavBar extends StatefulWidget {
  const HyperNavBar({required this.tabMenu, Key? key}) : super(key: key);
  final HyprAppBarTabMenu tabMenu;

  @override
  _HyperNavBarState createState() => _HyperNavBarState();
}

class _HyperNavBarState extends State<HyperNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              DrawerButton(),
              const NavBarLogo(),
              const NavBarItem(iconType: ItemType.search),
            ],
          ),
          Visibility(
            visible: !(getScreenType(context) == DeviceType.tablet),
              child:Expanded(child: widget.tabMenu)
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
               NavBarItem(iconType: ItemType.divider),
               NavBarItem(iconType: ItemType.messages),
               NavBarItem(iconType: ItemType.alerts),
            ],
          )
        ],
      ),
    );
  }
}
