import 'package:flutter/material.dart';

Widget customNetworkImage(String? url, double width, double height) {
  return Image.network(
    url ?? 'https://artsmidnorthcoast.com/wp-content/uploads/2014/05/no-image-available-icon-6.png',
    fit: BoxFit.cover,
    width: width,
    height: height,
  );
}