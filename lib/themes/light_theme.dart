import 'package:flutter/material.dart';

import '../utils/color.dart';

ThemeData lightTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.colorPrimaryLightGreen, // background (button) color
      foregroundColor: Colors.white, // foreground (text) color
    ),
  ),
  tabBarTheme: TabBarTheme(
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.all(Colors.white)),
  // appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
  scaffoldBackgroundColor: AppColor.white,
  cardColor: AppColor.white,
  primaryColor: AppColor.colorPrimaryLightGreen,
  useMaterial3: true,
  // timePickerTheme: _timePickerTheme,
  // datePickerTheme: _datePickerTheme,
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: MaterialStateProperty.all(AppColor.black.withOpacity(.3)),
  ),
  highlightColor: AppColor.colorTransparent,
  splashColor: AppColor.colorTransparent,
  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(color: AppColor.colorSecondaryLightYellow),
    checkColor: MaterialStateProperty.all(AppColor.colorBackGroundLight),
  ),
  colorScheme: const ColorScheme(
    background: AppColor.colorBackGroundLight, //for background
    inverseSurface: AppColor.colorBackGroundLight, // for Icons
    tertiary: AppColor.colorInputBackground,
    tertiaryContainer: AppColor.colorInputBackground,
    onTertiary: AppColor.colorSecondaryLightYellow,
    brightness: Brightness.light,
    primary: AppColor.colorPrimaryLightGreen,
    primaryContainer: AppColor.colorPrimaryLightGreen,
    onPrimary: AppColor.colorTextGrayDark,
    secondary: AppColor.colorSecondaryLightYellow,
    secondaryContainer: AppColor.colorPrimaryLightGreen,
    onSecondary: AppColor.colorSecondaryLightYellow,
    error: AppColor.colorRed,
    onError: AppColor.colorRed,
    onBackground: AppColor.colorBackGroundLight,
    surface: AppColor.colorTextGrayLight,
    onSurface: AppColor.colorTextGrayLight,
    surfaceTint: AppColor.colorTextGrayLight,
    onInverseSurface: AppColor.grayLight,
    errorContainer: AppColor.darkBlue,
    onSurfaceVariant: AppColor.colorTextWhite, //for text light or white
    surfaceVariant: AppColor.colorBackGroundLight,
    inversePrimary: AppColor.colorBackGroundLight,
    onPrimaryContainer: AppColor.gray,
  ),
);
