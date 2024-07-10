import 'package:flutter/material.dart';

import '../utils/color.dart';


ThemeData darkTheme = ThemeData(

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.colorPrimaryLightGreen, // background (button) color
      foregroundColor: Colors.white, // foreground (text) color
    ),
  ),
  scaffoldBackgroundColor: AppColor.black,
  primaryColor: AppColor.colorSecondaryLightYellow,
  cardColor: AppColor.colorDarkCard,
  useMaterial3: true,
  // timePickerTheme: _timePickerTheme,
  // datePickerTheme: _datePickerTheme,
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: MaterialStateProperty.all(AppColor.white.withOpacity(.3)),
  ),
  highlightColor: AppColor.colorTransparent,
  splashColor: AppColor.colorTransparent,
  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(color: AppColor.colorSecondaryLightYellow),
    checkColor: MaterialStateProperty.all(AppColor.colorBackGroundLight),
  ),
  colorScheme: const ColorScheme(
    background: AppColor.colorBackGroundDark,
    //for background
    inverseSurface: AppColor.colorBackGroundLight,
    // for Icons
    tertiary: AppColor.colorBackGroundLight,
    tertiaryContainer: AppColor.colorInputBackground,
    onTertiary: AppColor.colorTextWhite,
    brightness: Brightness.light,
    primary: AppColor.colorSecondaryLightYellow,
    primaryContainer: AppColor.colorBackGroundLight,
    onPrimary: AppColor.colorBackGroundLight,
    secondary: AppColor.colorPrimaryLightGreen,
    secondaryContainer: AppColor.colorPrimaryLightGreen,
    onSecondary: AppColor.colorSecondaryLightYellow,
    error: AppColor.colorTextWhite,
    onError: AppColor.colorTextWhite,
    onBackground: AppColor.colorPrimaryLightGreen,
    surface: AppColor.colorTextGrayLight,
    surfaceTint: AppColor.colorInputBackground,
    onSurface: AppColor.colorBackGroundLight,
    onInverseSurface: AppColor.darkBlue,
    errorContainer: AppColor.darkBlue,
    onSurfaceVariant: AppColor.colorPrimaryLightGreen,
    //for text
    surfaceVariant: AppColor.colorInputBackground,
    inversePrimary: AppColor.colorSecondaryLightYellow,
    onPrimaryContainer: AppColor.colorSecondaryLightYellow,
  ),
);
