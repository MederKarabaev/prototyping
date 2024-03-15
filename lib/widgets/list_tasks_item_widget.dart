import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prototyping/core/images/app_images.dart';
import 'package:prototyping/theme/app_colors.dart';
import 'package:prototyping/theme/app_text_styles.dart';

class ListTasksItem extends StatelessWidget {
  const ListTasksItem({
    super.key,
    this.name,
    this.data,
    this.color,
    this.images,
    this.onTap,
  });

  final String? name;
  final String? data;
  final String? images;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          InkWell(
            onTap: onTap ?? () {},
            child: Row(
              children: [
                const SizedBox(width: 10),
                SvgPicture.asset(
                  images ?? AppImages.isnotactiveIconSvg,
                  color: Colors.black,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? 'Send documents to Beeline',
                      style: AppTextStyles.s16WBold(
                        color: AppColors.color20Black21262C,
                      ),
                    ),
                    Text(
                      data ?? '18h30 left',
                      style: AppTextStyles.s14Wbold(
                        color: AppColors.colorGreyCDCDCD,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: color ?? AppColors.colorFDFDFD,
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Divider(
            thickness: 2,
            color: AppColors.colorGreyD9D9D9,
          ),
        ],
      ),
    );
  }
}
