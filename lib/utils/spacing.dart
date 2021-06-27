import 'package:flutter/widgets.dart';

const hugeSpacingPercentage = .08;
const largeSpacingPercentage = .06;
const mediumSpacingPercentage = .04;
const smallSpacingPercentage = .02;
const tinySpacingPercentage = .01;

const double avatarSize = 56;
const double largeIconSize = 50;
const double largeRoundButtonSize = 48;
const double mediumRoundButtonSize = 40;
const double smallRoundButtonSize = 36;
const double tinyRoundButtonSize = 24;
const double buttonHeight = mediumRoundButtonSize;
const double xIconSize = 17.44;
const double cardPadding = 8;
const double headerPadding = 16;

///Returns full width of screen minus specified spacing on both sides
double returnFullScreenWidthMinusSpacing(
  BuildContext context, {
  double spacingPercentage = mediumSpacingPercentage,
}) {
  final _fullWidth = returnFullWidth(context);
  final _mediumSpacing = _fullWidth * spacingPercentage;
  return _fullWidth - _mediumSpacing * 2;
}

double returnFullScreenWidthMinusSmallSpacing(
  final BuildContext context,
) {
  return returnFullScreenWidthMinusSpacing(
    context,
    spacingPercentage: smallSpacingPercentage,
  );
}

///Returns the width's medium spacing percentage as pixels
double returnWidthMediumSpacing(BuildContext context) =>
    returnFullWidth(context) * mediumSpacingPercentage;

///Returns the height's medium spacing percentage as pixels
double returnHeightMediumSpacing(BuildContext context) =>
    returnFullHeight(context) * mediumSpacingPercentage;

///Returns the width's medium spacing percentage as pixels
double returnWidthSmallSpacing(BuildContext context) =>
    returnFullWidth(context) * smallSpacingPercentage;

///Returns the height's medium spacing percentage as pixels
double returnHeightSmallSpacing(BuildContext context) =>
    returnFullHeight(context) * smallSpacingPercentage;

///Returns the full width of the screen
double returnFullWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

///Returns the full height of the screen
double returnFullHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;
