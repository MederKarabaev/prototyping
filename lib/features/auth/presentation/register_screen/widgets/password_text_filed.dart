import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prototyping/core/images/app_images.dart';
import 'package:prototyping/theme/app_colors.dart';
import 'package:prototyping/widgets/custom_text_fields.dart';

class PasswordTextFiled extends StatefulWidget {
  const PasswordTextFiled(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});

  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;
  final Function(bool password) password;

  @override
  State<PasswordTextFiled> createState() => _PasswordTextFiledState();
}

class _PasswordTextFiledState extends State<PasswordTextFiled> {
  bool get is8characters => textFiledValue.length > 8;

  bool get isIncludeYourNameOrEamil =>
      !textFiledValue
          .toLowerCase()
          .contains(widget.firstName.text.toLowerCase()) &&
      !textFiledValue
          .toLowerCase()
          .contains(widget.lastName.text.toLowerCase()) &&
      !textFiledValue.toLowerCase().contains(
            widget.email.text.toLowerCase(),
          );

  bool get isHaveSymbolOrNumber =>
      RegExp(r'[\p{Latin}а-яА-Я]').hasMatch(textFiledValue) &&
      RegExp(r'[0-9]').hasMatch(textFiledValue);

  bool get isContainSpaces => !textFiledValue.contains(' ');

  String textFiledValue = '';

  bool get getAllRight =>
      is8characters &&
      isIncludeYourNameOrEamil &&
      isHaveSymbolOrNumber &&
      isContainSpaces;

  bool hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          onFocusChange: (focus) {
            setState(() {
              hasFocus = focus;
            });
          },
          onChanged: (value) {
            setState(() {
              textFiledValue = value;
            });
            widget.password(getAllRight);
          },
          suffixIcon: true,
          obscureText: true,
          labelText: 'Password',
        ),
        const SizedBox(height: 8),
        Visibility(
          visible: hasFocus || textFiledValue.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppImages.exclamationIconSvg,
                    color: getAllRight ? AppColors.colorGreen00DD00 : null,
                  ),
                  const SizedBox(width: 12),
                  const Text('Password strength: '),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SvgPicture.asset(
                    is8characters
                        ? AppImages.checkIconSvg
                        : AppImages.closeIconSvg,
                  ),
                  const SizedBox(width: 12),
                  const Text('Must be at least 8 characters'),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    isIncludeYourNameOrEamil
                        ? AppImages.checkIconSvg
                        : AppImages.closeIconSvg,
                  ),
                  const SizedBox(width: 12),
                  const Text('Can not include your name or eamil address'),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    isHaveSymbolOrNumber
                        ? AppImages.checkIconSvg
                        : AppImages.closeIconSvg,
                  ),
                  const SizedBox(width: 12),
                  const Text('Must have at least one symbol or number'),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    isContainSpaces
                        ? AppImages.checkIconSvg
                        : AppImages.closeIconSvg,
                  ),
                  const SizedBox(width: 12),
                  const Text('Can not contain spaces'),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
