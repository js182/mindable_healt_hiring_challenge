import 'package:flutter/material.dart';

class TextStyles {
  static const String defaultFontFamily = 'Inter';
  static const String secondaryFontFamily = 'Circular Std';

  static const detailTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 16,
  );

  static const buttonSmallTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 14,
  );

  static const subtitleTextStyle = TextStyle(
    fontFamily: secondaryFontFamily,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 17,
  );

  static const headline2TextStyle = TextStyle(
    fontFamily: secondaryFontFamily,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 28,
  );

  static const descriptionTextTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14,
  );

  static const overlineTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 14,
  );
}
