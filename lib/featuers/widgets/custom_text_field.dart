import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';

typedef MyValidator = String? Function(String?)?;

class CustomTextField extends StatelessWidget {
  Color? filledColor;
  Color? borderColor;
  String hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  TextStyle? style;
  Widget? prefixIcon;
  Widget? suffixIcon;
  int? maxLines;
  bool obSecureText;
  bool? readOnly;
  String? Function(String?)? validator;
  Null Function()? onTap;
  TextEditingController? controller;
  TextInputType? keyboardType;

  CustomTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.style,
    this.maxLines,
    this.filledColor,
    this.obSecureText = false,
    this.borderColor,
    this.readOnly,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, bottom: 20.h),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        maxLines: maxLines ?? 1,
        cursorColor: AppColors.blackColor,
        style: style ?? AppStyles.semi20Primary,
        obscureText: obSecureText,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.whiteColor,
          hintText: hintText,
          labelText: labelText,
          labelStyle: labelStyle,
          hintStyle: hintStyle ?? AppStyles.medium14LightPrimary,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.whiteColor,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.whiteColor,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColors.redColor,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColors.redColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
