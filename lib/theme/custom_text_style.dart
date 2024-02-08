import 'package:flutter/material.dart';
import 'package:havi_lah/core/utils/size_utils.dart';
import 'package:havi_lah/theme/theme_helper.dart';

class CustomTextStyles {
  // Body text style
  static get bodyMedium15 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 15.fSize,
      );
  static get bodyMediumMontserrat =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        fontSize: 13.fSize,
      );
}

extension on TextStyle {
  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
