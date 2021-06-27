import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/color.dart';

enum ItemType {
  tribes,
  music,
  discover,
  alerts,
  sound,
  messages,
  movement,
  divider,
  search
}

class NavBarItem extends StatelessWidget {
  const NavBarItem({required this.iconType, this.iconSize = 40});

  final ItemType iconType;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final TextEditingController txt = TextEditingController();
    switch (iconType) {
      case ItemType.alerts:
        return Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: iconSize,
          child: FlutterLogo(),
        );

      case ItemType.discover:
        return Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: iconSize,
          child: FlutterLogo(),
        );
      case ItemType.music:
        return Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: iconSize,
          child: FlutterLogo(),
        );
      case ItemType.sound:
        return Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: iconSize,
          child: FlutterLogo(),
        );
      case ItemType.tribes:
        return Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: iconSize,
          child: FlutterLogo(),
        );
      case ItemType.messages:
        return Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: iconSize,
          child: FlutterLogo(),
        );
      case ItemType.movement:
        return Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: iconSize,
          child: SvgPicture.asset('assets/images/icons/movement_icon.svg'),
        );
      case ItemType.divider:
        return Container(
          height: iconSize,
          width: 2,
          color: Colors.white,
        );
      case ItemType.search:
        return Container(
          height: iconSize,
          width: 200,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            textAlign: TextAlign.center,
            controller: txt,
            decoration: InputDecoration(
              fillColor: themeBoxBlueLightest,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'search',
              hintStyle: const TextStyle(color: Colors.white),
            ),
          ),
        );
    }
  }
}
