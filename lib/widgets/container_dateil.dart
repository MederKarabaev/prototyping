import 'package:flutter/material.dart';
import 'package:prototyping/theme/app_colors.dart';
import 'package:prototyping/theme/app_text_styles.dart';

class ContainerDateil extends StatelessWidget {
  const ContainerDateil({
    super.key,
    required this.titel,
    this.horizontal,
    this.colorBg,
  });

  final String titel;
  final double? horizontal;
  final Color? colorBg;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      decoration: BoxDecoration(
        color: colorBg ?? AppColors.colorGrey9A9A9A,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal ?? 10,
          vertical: 3,
        ),
        child: Text(
          titel,
          style: AppTextStyles.s12Wbold(color: Colors.white),
        ),
      ),
    );
  }
}
