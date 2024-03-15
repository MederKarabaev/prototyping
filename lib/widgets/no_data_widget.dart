import 'package:flutter/material.dart';
import 'package:prototyping/theme/app_colors.dart';
import 'package:prototyping/theme/app_text_styles.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({this.title = 'Нет данных', super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyles.s24W900(
          color: AppColors.colorBlue0821AE,
        ),
      ),
    );
  }
}
