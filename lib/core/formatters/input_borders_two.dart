import 'package:flutter/material.dart';
import 'package:prototyping/theme/app_colors.dart';

class InputBorders {
  static OutlineInputBorder outlineBorderColorE5E5E5Width1Radius10 =
      const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.colorGrey,
      width: 1.20,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
  );

  static OutlineInputBorder outlineBorderColorGreenWidth2Radius10 =
      const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.colorGrey,
      width: 1.20,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
  );
  static const OutlineInputBorder outlineBordercolorF68080Width2Radius10 =
      OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.colorGrey,
      width: 1.20,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(
        10,
      ),
    ),
  );

  static const UnderlineInputBorder unOutlineBorderColorE5E5E5Width1 =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.colorGrey,
      width: 1.20,
    ),
  );
  static const UnderlineInputBorder unOutlineBorderColorGreenWidth2 =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.colorGrey,
      width: 1.20,
    ),
  );
  static const UnderlineInputBorder unOutlineBordercolorF68080Width2 =
      UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.colorGrey,
      width: 1.20,
    ),
  );
}
