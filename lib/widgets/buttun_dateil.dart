import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototyping/theme/app_text_styles.dart';

class ButtunDateil extends StatelessWidget {
  const ButtunDateil({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.colorTwo,
    this.isActive = false,
  });
  final bool isActive;
  final Color color;
  final Color colorTwo;
  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.only(right: 10),
      onPressed: onPressed,
      child: Container(
        height: 28,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        decoration: ShapeDecoration(
          color: isActive ? colorTwo : null,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color: colorTwo,
            ),
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Column(
          children: [
            Text(
              text,
              style: AppTextStyles.s12W400(
                color: isActive ? Colors.white : color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
