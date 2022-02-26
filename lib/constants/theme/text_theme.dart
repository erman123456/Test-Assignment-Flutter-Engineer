import 'package:flutter/material.dart';
import '../colors.dart';
import '../font_family.dart';

class TextStyleCustom {
  TextStyleCustom._();

  static const robotoFont = FontFamily.roboto;
  static const latoFont = FontFamily.lato;

  static const FontWeight weightRegular = FontWeight.w400;
  static const FontWeight weightMedium = FontWeight.w500;
  static const FontWeight weightBold = FontWeight.bold;

  static const Color colorDefault = ColorsCustom.black1;
  static const Color colorPrimary = ColorsCustom.orange1;

  static TextStyle caption1 = const TextStyle(
    fontSize: 14,
    fontFamily: robotoFont,
    fontWeight: weightRegular,
    color: colorDefault,
  );

  static TextStyle h6Bold = const TextStyle(
    fontSize: 14,
    fontFamily: latoFont,
    fontWeight: weightBold,
    color: colorDefault,
  );

  static TextStyle h2 = TextStyle(
    fontSize: 60,
    fontFamily: latoFont,
    fontWeight: weightRegular,
    color: colorDefault,
  );
  static TextStyle h3 = TextStyle(
    fontSize: 48,
    fontFamily: latoFont,
    fontWeight: weightRegular,
    color: colorDefault,
  );
}
