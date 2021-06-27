import 'package:flutter/material.dart';

import '../../utils/default_images.dart';
import '../../utils/text_style.dart';

class RoundedSquareCard extends StatelessWidget {
  const RoundedSquareCard({
    this.title,
    this.subtitle,
    this.backgroundImageUrl,
    this.showOverlayPlayIcon = false,
    Key? key,
  }) : super(key: key);

  final String? backgroundImageUrl;
  final bool showOverlayPlayIcon;
  final String? subtitle;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return _returnRoundedSquareCard(context);
  }

  Widget _returnRoundedSquareCard(BuildContext context) {
    return Container(
      height: 190,
      width: 150,
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 150,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(backgroundImageUrl ?? defaultWideCardBackgroundUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(child: Builder(builder: (context) {
                  final condition = showOverlayPlayIcon;
                  if (condition) {
                    return Image.asset(
                      'assets/images/common/play_overlay.png',
                      width: 30,
                      height: 38,
                      fit: BoxFit.contain,
                    );
                  } else {
                    return const Text('');
                  }
                })),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
              child: Text(
                title ?? '',
                style: cardTitleTextBoldStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                subtitle ?? '',
                style: cardTitleGrayTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
