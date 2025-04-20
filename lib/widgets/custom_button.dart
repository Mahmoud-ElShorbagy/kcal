import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/helpers/app_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.onTap,
      this.color = AppColors.primary,
      this.borderRadius = 20,
      this.height = 54,
      this.fontWeight = FontWeight.w600,
      this.fontSize = 21,
      this.width = 294,
      this.textColor = AppColors.white,
      this.padding,
      this.margin,
      this.borderColor});
  final String text;
  final void Function()? onTap;
  final Color? color;
  final double borderRadius;
  final double height;
  final double width;
  final FontWeight fontWeight;
  final double fontSize;
  final Color textColor;
  final EdgeInsetsGeometry? margin, padding;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? Colors.transparent,
            ),
            color: color,
            borderRadius: BorderRadius.circular(borderRadius).r),
        height: height.h,
        width: width.w,
        child: CustomText(
            text: text,
            fontSize: fontSize.sp,
            fontWeight: fontWeight,
            fontFamily: "WorkSans",
            color: textColor),
      ),
    );
  }
}
