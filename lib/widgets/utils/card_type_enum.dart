import 'package:flutter/material.dart';

enum CardTypeEnum {
  tallCard,
  newsCard,
  storyCard,
  tweetCard,
  roundedSquare,
  artistVideoCard,
  featuredVideoCard,
  photoStreamCard
}

extension CardTypeHelper on CardTypeEnum {
  double getHeight(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    switch (this) {
      case CardTypeEnum.tallCard:
        return 220;
      case CardTypeEnum.roundedSquare:
        return 150;
      // case CardTypeEnum.sweepStakeCard:
      //   return width < 800 ? width * 0.8 * 0.38 : 320 * 0.38;
      case CardTypeEnum.artistVideoCard:
        return width < 800 ? width * 0.54 : 320 * 0.54;
      case CardTypeEnum.featuredVideoCard:
        return width < 800 ? width * 0.8 * 0.5 : 300 * 0.5;
      case CardTypeEnum.newsCard:
        return 150;
      case CardTypeEnum.storyCard:
        return 180;
      case CardTypeEnum.tweetCard:
        return 190;
      case CardTypeEnum.photoStreamCard:
        return 330;
    }
  }
}
