import 'package:flutter/material.dart';
import 'package:prototyping/theme/app_colors.dart';

class AppInputBorders {
  static const OutlineInputBorder outlineBorderColor100Black101820Radius12 =
      OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.color100Black101820,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  );
  static const OutlineInputBorder outlineBorderColor10Grey004646Radius12 =
      OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.color10Grey004646,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  );
  static const OutlineInputBorder
      outlineBorderColor100Black101820Radius12RIGHT = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.color100Black101820,
    ),
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(12),
      bottomRight: Radius.circular(12),
    ),
  );
  static const OutlineInputBorder outlineBorderColor10Grey004646Radius12RIGHT =
      OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.color10Grey004646,
    ),
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(12),
      bottomRight: Radius.circular(12),
    ),
  );
}
