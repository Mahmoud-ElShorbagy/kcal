import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/helpers/app_colors.dart';
import 'custom_text.dart';

class CustomTextBody extends StatelessWidget {
  const CustomTextBody({
    super.key,
    required this.text,
    required this.title,
    required this.subTitle,
    this.color = AppColors.textPrimary,
    this.fontSizeSmall = 0,
    this.fontSizedBig = 0,
    this.changeAxisSize = false,
    this.changeFontSize = false,
  });
  final double fontSizeSmall, fontSizedBig;
  final String text;
  final String title;
  final String subTitle;
  final Color color;
  final bool changeAxisSize;
  final bool changeFontSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          changeAxisSize ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        CustomText(
            text: text,
            fontSize: changeFontSize ? fontSizedBig : 21.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "WorkSans",
            color: AppColors.black),
        SizedBox(height: 6.h),
        CustomText(
          height: 1.7.h,
          text: title,
          fontSize: changeFontSize ? fontSizeSmall : 16.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "WorkSans",
          color: color,
          letterSpacing: 0.2.sp,
        ),
        CustomText(
          text: subTitle,
          fontSize: changeFontSize ? fontSizeSmall : 16.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "WorkSans",
          color: color,
          letterSpacing: 0.2.sp,
        ),
      ],
    );
  }
}
