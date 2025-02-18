import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTxt extends StatelessWidget {
  final Color? fontColor;
  final String? text;
  final double? fontSize;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;

  CustomTxt(
      {required this.text,
      this.fontColor,
      this.fontSize,
      this.textStyle,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text!,
      overflow: TextOverflow.ellipsis,
      style: textStyle ??
          Theme.of(context).textTheme.titleMedium?.copyWith(
              color: fontColor ?? AppColors.primaryColor,
              fontWeight: fontWeight ?? FontWeight.w500,
              fontSize: fontSize ?? 18.sp),
    );
  }
}
