import 'package:flutter/material.dart';

import '../../utils/icons.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({
    required this.onTap,
    this.color = Colors.white,
    this.isPrefixIcon = false,
  });

  final void Function() onTap;
  final Color color;
  final bool isPrefixIcon;

  EdgeInsetsGeometry get _padding {
    if (!isPrefixIcon) {
      //this padding is to make it easier to tap
      return const EdgeInsets.only(
        top: 10,
        right: 20,
        bottom: 10,
      );
    }

    return const EdgeInsets.symmetric(
      vertical: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: _padding,
        child: Image.asset(
          '$iconsAssetsPath/left_chevron.png',
          height: 16,
          color: color,
        ),
      ),
    );
  }
}
