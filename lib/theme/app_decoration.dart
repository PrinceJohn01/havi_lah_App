import 'package:flutter/material.dart';
import 'package:havi_lah/core/utils/size_utils.dart';
import 'package:havi_lah/theme/theme_helper.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlackC => BoxDecoration(
        color: appTheme.black9004c,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );

  // Gradient decorations
  static BoxDecoration get gradientBlueToIndigo => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.07, 0),
          end: const Alignment(0.8, 1.24),
          colors: [
            appTheme.blue500,
            appTheme.indigo900,
          ],
        ),
      );
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderBL30 => BorderRadius.vertical(
        bottom: Radius.circular(30.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder19 => BorderRadius.circular(
        19.h,
      );
  static BorderRadius get roundedBorder30 => BorderRadius.circular(
        30.h,
      );
}

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;
