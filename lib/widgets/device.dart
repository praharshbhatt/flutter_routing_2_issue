import 'package:flutter/cupertino.dart';

enum DeviceType { phone, tablet, desktop, web }

DeviceType getScreenType(BuildContext context) {
  final Size size = MediaQuery.of(context).size;

  if (size.width < 800) {
    return DeviceType.phone;
  }

  if (size.width >= 800 && size.width < 1200) {
    return DeviceType.tablet;
  }

  if (size.width >= 1200 && size.width < 1440) {
    return DeviceType.desktop;
  }

  return DeviceType.web;
}
