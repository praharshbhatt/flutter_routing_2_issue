import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/font.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({required this.title, required this.pngAsset});

  final String title;
  final String pngAsset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
      child: InkWell(
        onTap: (){},
        child: Row(
          children: [
             ImageIcon(AssetImage(pngAsset), color: Colors.white,),
            const SizedBox(width: 10),
            Text(
              title,
              style: drawerTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
