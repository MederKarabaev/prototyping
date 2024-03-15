// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:prototyping/core/images/app_images.dart';
import 'package:prototyping/theme/app_text_styles.dart';

class DocumentSettingsPaddingDateil extends StatelessWidget {
  const DocumentSettingsPaddingDateil({
    Key? key,
    this.title,
    this.icon,
    this.onTap,
    this.widthIcon,
    this.widthText,
    this.top,
    this.left,
  }) : super(key: key);

  final String? title;
  final String? icon;
  final Function()? onTap;
  final double? widthIcon;
  final double? widthText;
  final double? top;
  final double? left;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? 23,
        top: top ?? 5,
        bottom: 15,
      ),
      child: InkWell(
        onTap: onTap ?? () {},
        child: Row(
          children: [
            SvgPicture.asset(
              icon ?? AppImages.addIconSvg,
              width: widthIcon ?? 24,
            ),
            SizedBox(width: widthText ?? 10),
            Text(
              title ?? 'Invite to Sign',
              style: AppTextStyles.s16W400(),
            ),
          ],
        ),
      ),
    );
  }
}
