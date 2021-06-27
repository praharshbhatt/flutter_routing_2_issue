
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/font.dart';
import '../../utils/text_style.dart';

Widget sectionHeader(String text, {bool isFirst = false, bool seeAll = true}) {
  return Column(children: [
    SizedBox(
      height: isFirst ? 0 : 19,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: homeTitleTextStyle,
        ),
        const SizedBox(
          width: 8,
        ),
        InkWell(
          onTap: (){},
          child: seeAll
              ? Row(
            children: [
              Text(
                'seeAll'.tr,
                style: seeAllTextStyle,
              ),
              const SizedBox(
                width: 8,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: fontColorGrey,
                size: 15,
              )
            ],
          )
              : Container(),
        )
      ],
    ),
    const SizedBox(
      height: 19,
    )
  ]);
}