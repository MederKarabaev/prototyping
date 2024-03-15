import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prototyping/core/images/app_images.dart';
import 'package:prototyping/theme/app_colors.dart';
import 'package:prototyping/theme/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.inputFormatters,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.isOutline = true,
    this.hintText,
    this.suffixIcon = false,
    this.onFocusChange,
    this.onChanged,
    this.isError = false,
    this.isFilled = false,
    this.fillColor,
    this.hasFocuSColor,
    this.widthBorder,
  });

  final List<TextInputFormatter>? inputFormatters;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool isOutline;
  final String? hintText;
  final bool suffixIcon;
  final Function(String)? onChanged;
  final Function(bool)? onFocusChange;
  final bool isError;
  final bool isFilled;
  final double? widthBorder;
  final Color? fillColor;
  final Color? hasFocuSColor;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();

  bool hasFocus = false;
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hasFocus
              ? widget.hasFocuSColor ?? Colors.black
              : AppColors.color10Grey004646,
          width: widget.widthBorder ?? 1,
        ),
      ),
      child: Focus(
        onFocusChange: (focus) {
          if (widget.onFocusChange != null) {
            widget.onFocusChange!(focus);
          }
          setState(() {
            hasFocus = focus;
          });
        },
        child: TextFormField(
          onChanged: widget.onChanged,
          focusNode: _focusNode,
          inputFormatters: widget.inputFormatters,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText:
              widget.obscureText && widget.suffixIcon ? !_isVisible : false,
          validator: widget.validator,
          cursorColor: Colors.black,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            fillColor: widget.fillColor,
            filled: widget.isFilled,
            suffixIcon: widget.suffixIcon
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    icon: Icon(
                      _isVisible ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.color60Black101820,
                    ),
                  )
                : widget.isError
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: SvgPicture.asset(
                          AppImages.exclamationIconSvg,
                        ),
                      )
                    : null,
            hintText: widget.hintText,
            labelText: widget.labelText,
            labelStyle: AppTextStyles.s12W400(
              color: widget.isError
                  ? AppColors.colorRedEF1000
                  : AppColors.color60Black101820,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            errorBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
