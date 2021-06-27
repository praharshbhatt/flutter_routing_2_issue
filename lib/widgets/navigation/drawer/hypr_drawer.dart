import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tribes/utils/font.dart';

import '../../../utils/color.dart';
import '../navbar_logo_item.dart';
import 'drawer_item.dart';

class HyprDrawer extends StatefulWidget {
  const HyprDrawer({Key? key}) : super(key: key);

  @override
  _HyprDrawerState createState() => _HyprDrawerState();
}

class _HyprDrawerState extends State<HyprDrawer> {
  late Size screenSize;

  @override
  void didChangeDependencies() {
    screenSize = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: screenSize.width >= 400 ? 300 : screenSize.width * 0.7,
          decoration: const BoxDecoration(
            color: themeBoxBlueLightest,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close, color: Colors.white, size: 30,),
                    ),
                    const Padding(
                      padding:  EdgeInsets.only(left: 10),
                      child:  NavBarLogo(),
                    )
                  ],
                ),
                const Divider(color: Colors.white),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/images/user.jpg'),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child:  Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                         children: const [
                           Text('Janine Jameson', style: drawerTextStyle, textAlign: TextAlign.left,),
                           Text('See my profile', style: drawerTextStyle2, textAlign: TextAlign.left),
                        ],
                      ),
                    )
                  ],
                ),
                const Divider(color: Colors.white),
                DrawerItem(title: 'messages'.tr, pngAsset: 'assets/images/icons/icon_messages.png'),
                const Divider(color: Colors.white),
                DrawerItem(title: 'videos'.tr, pngAsset: 'assets/images/icons/icon_videos.png'),
                const Divider(color: Colors.white),
                DrawerItem(title: 'movements'.tr, pngAsset: 'assets/images/icons/icon_movements.png',),
                const Divider(color: Colors.white),
                DrawerItem(title: 'challenges'.tr, pngAsset: 'assets/images/icons/icon_challenges.png',),
                const Divider(color: Colors.white),
                DrawerItem(title: 'settings'.tr, pngAsset: 'assets/images/icons/icon_settings.png',),
                const Divider(color: Colors.white),
                DrawerItem(title: 'inviteFriends'.tr, pngAsset: 'assets/images/icons/icon_invite_friend.png'),
                const Divider(color: Colors.white),
                DrawerItem(title: 'appInfo'.tr, pngAsset: 'assets/images/icons/icon_appInfo.png',),
                const Divider(color: Colors.white),
                DrawerItem(title: 'logout'.tr, pngAsset: 'assets/images/icons/icon_logout.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
