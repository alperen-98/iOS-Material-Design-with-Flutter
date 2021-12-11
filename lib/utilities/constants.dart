import 'package:flutter/material.dart';
import 'package:fruits_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

//text style
const kInfoTitleTextStyle = const TextStyle(
  color: Colors.grey,
  fontSize: 17,
  fontWeight: FontWeight.w700,
);

const kInfoDataTextStyle = const TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.bold,
);

const kContentSourceTextStyle = const TextStyle(
  fontSize: 14,
);

TextStyle appBarTitleStyle(context) =>
    Provider.of<ThemeProvider>(context).isDarkTheme
        ? TextStyle(color: Colors.white)
        : TextStyle(color: Colors.black);

Color adaptiveIconColor(context) =>
    Provider.of<ThemeProvider>(context).isDarkTheme
        ? Colors.white
        : Colors.black;

//border radius
const kBorderRadius12 = BorderRadius.all(Radius.circular(12));

//size
const double kHeight = 100.0;
const double kWidth = 100.0;

//padding
const kPadding = const EdgeInsets.all(12);
const kSettingsPaddingContent = const EdgeInsets.all(15.0);

// links
const String wikipediaURL = "https://wikipedia.com";
const String myGitHubProfileURL = "https://github.com/alperen-98";
const String myTwitterProfileURL = "https://twitter.com/oiworlditsme";

// fruit light colors
const Color ColorAppleLight = const Color(0xFFFF8093);
const Color ColorBlueberryLight = const Color(0xFF66D6FF);
const Color ColorCherryLight = const Color(0xFFD5FF4C);
const Color ColorGooseberryLight = const Color(0xFFDDE366);
const Color ColorGrapefruitLight = const Color(0xFFFFBD80);
const Color ColorLemonLight = const Color(0xFFFFF242);
const Color ColorLimeLight = const Color(0xFF6BEF67);
const Color ColorMangoLight = const Color(0xFFFFE95C);
const Color ColorPearLight = const Color(0xFFFFC15D);
const Color ColorPlumLight = const Color(0xFFFF7A93);
const Color ColorPomegranateLight = const Color(0xFFFD869A);
const Color ColorStrawberryLight = const Color(0xFFFF809B);
const Color ColorWatermelonLight = const Color(0xFF84F476);

// fruit dark colors
const Color ColorAppleDark = const Color(0xFFFF0040);
const Color ColorBlueberryDark = const Color(0xFF247FFF);
const Color ColorCherryDark = const Color(0xFF7CBB00);
const Color ColorGooseberryDark = const Color(0xFF678A00);
const Color ColorGrapefruitDark = const Color(0xFFFF8229);
const Color ColorLemonDark = const Color(0xFFFFA800);
const Color ColorLimeDark = const Color(0xFF009443);
const Color ColorMangoDark = const Color(0xFF7CBB00);
const Color ColorPearDark = const Color(0xFFDA7720);
const Color ColorPlumDark = const Color(0xFFFF183F);
const Color ColorPomegranateDark = const Color(0xFFD600A8);
const Color ColorStrawberryDark = const Color(0xFFFF0059);
const Color ColorWatermelonDark = const Color(0xFF3B9834);
