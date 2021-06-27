import 'package:flutter/material.dart';

import '../../utils/default_images.dart';
import '../../utils/text_style.dart';

enum RoundedRectangleCardType {
  largeVideo,
  wide,
}

class RoundedRectangleCard extends StatelessWidget {
  final String? backgroundImageUrl;
  final String? subtitle;
  final String? title;
  final String? rightTitle;
  final String? rightSubtitle;
  final RoundedRectangleCardType cardType;
  final double imageWidth;
  final double imageHeight;

  const RoundedRectangleCard({
    required this.imageWidth,
    required this.imageHeight,
    this.title,
    this.subtitle,
    this.rightSubtitle = '',
    this.rightTitle = '',
    this.backgroundImageUrl,
    this.cardType = RoundedRectangleCardType.wide,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _returnRoundedRectangleCard(context);
  }

  Widget _returnRoundedRectangleCard(BuildContext context) {
    // final double screenDefinedWidth =
    //     MediaQuery.of(context).size.height > MediaQuery.of(context).size.width
    //         ? MediaQuery.of(context).size.width * 0.9
    //         : 400;

    return Column(
      children: [
        //Video
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: imageWidth,
            height: imageHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  backgroundImageUrl ?? defaultWideCardBackgroundUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: cardType == RoundedRectangleCardType.largeVideo
                ? Center(
                    child: Image.asset(
                      'assets/images/common/video_play_overlay.png',
                      width: 80,
                      height: 80,
                    ),
                  )
                : Container(),
          ),
        ),

        Container(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          width: imageWidth,
          child: Column(
            children: [
              /// Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Title
                  Flexible(
                    child: Text(
                      title ?? '',
                      style: cardTitleTextStyle,
                      // maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  //Right Title
                  Visibility(
                    visible: rightTitle?.isNotEmpty ?? false,
                    child: Flexible(
                      child: Text(
                        rightTitle ?? '',
                        style: cardTitleTextStyle,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),

              /// SubTitle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //SubTitle
                  Flexible(
                    child: Text(
                      subtitle ?? '',
                      style: cardTitleGrayTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  //Right Subtitle
                  Visibility(
                    visible: rightSubtitle?.isNotEmpty ?? false,
                    child: Flexible(
                      child: Text(
                        rightSubtitle ?? '',
                        style: cardTitleGrayTextStyle,
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
