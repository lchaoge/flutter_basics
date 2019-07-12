import 'package:flutter/material.dart';

/// 颜色
class CGColors {
  // Brand Color
  static const String colorPrimary = "#409EFF";

  // Functional Color
  static const String colorSuccess = "#409EFF";
  static const String colorWarning = "#409EFF";
  static const String colorDanger = "#409EFF";
  static const String colorInfo = "#409EFF";
  
  // Font Color
  static const String colorTextPrimary = "#409EFF";
  static const String colorTextRegular = "#409EFF";
  static const String colorTextSecondary = "#409EFF";
  static const String colorTextPlaceholder = "#409EFF";

  // Border Color
  static const String borderColorBase = "#DCDFE6";
  static const String borderColorLight = "#E4E7ED";
  static const String borderColorLighter = "#EBEEF5";
  static const String borderColorExtraLight = "#F2F6FC";

  // Background Color
  static const String colorWhite = "#FFFFFF";
  static const String colorBlack = "#000000";
  static const String backgroundColorBase = "#F5F7FA";

  // static const MaterialColor primarySwatch = const MaterialColor(
  //   primaryValue,
  //   const <int, Color>{
  //     50: const Color(primaryLightValue),
  //     100: const Color(primaryLightValue),
  //     200: const Color(primaryLightValue),
  //     300: const Color(primaryLightValue),
  //     400: const Color(primaryLightValue),
  //     500: const Color(primaryValue),
  //     600: const Color(primaryDarkValue),
  //     700: const Color(primaryDarkValue),
  //     800: const Color(primaryDarkValue),
  //     900: const Color(primaryDarkValue),
  //   },
  // );

}

/// 文字样式
class CGConstant {
  
  static const lagerTextSize = 30.0;
  static const bigTextSize = 23.0;
  static const normalTextSize = 18.0;
  static const middleTextWhiteSize = 16.0;
  static const smallTextSize = 14.0;
  static const minTextSize = 12.0;

}

/// 图标
class CGICons {
  static const String FONT_FAMILY = 'IconFont';

  static const IconData HOME = const IconData(0xe624, fontFamily: CGICons.FONT_FAMILY);

}