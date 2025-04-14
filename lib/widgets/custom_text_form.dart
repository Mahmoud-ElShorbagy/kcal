import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/widgets/custom_image.dart';

import '../core/helpers/app_colors.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    this.controller,
    this.validator,
    this.onEditingComplete,
    this.onSaved,
    required this.image,
    this.obscureText = false,
    this.suffix,
    required this.hintText,
    this.bottom = 24,
    this.fillColor = AppColors.white,
    this.onTap,
    this.onChanged,
    this.fontWeight,
  });
  final TextEditingController? controller;
  final String? Function(String? v)? validator;
  final void Function()? onEditingComplete;
  final void Function(String?)? onSaved;
  final String image;
  final bool obscureText;
  final Widget? suffix;
  final String hintText;
  final double bottom;
  final Color? fillColor;
  final void Function()? onTap;
  final void Function(String v)? onChanged;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottom.h),
      width: 311.w,
      height: 43.h,
      child: TextFormField(
        obscureText: obscureText,
        style: appTextStyle(fontWeight),
        onEditingComplete: onEditingComplete,
        cursorColor: AppColors.primaryBaseGreen,
        onChanged: onChanged,
        onTap: onTap,
        onSaved: onSaved,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: appTextStyle(FontWeight.w400),
          hintText: hintText,
          suffixIcon: suffix,
          fillColor: fillColor,
          filled: true,
          prefixIcon: Container(
            margin: EdgeInsets.only(left: 16.w, right: 8.w),
            child: CustomImageWidget(image: image, width: 24, height: 24),
          ),
          enabledBorder: buildInputBorder(3.w, AppColors.primaryLightGreen100),
          focusedBorder: buildInputBorder(1.w, AppColors.primaryBaseGreen),
          focusedErrorBorder: buildInputBorder(1.w, AppColors.secondaryDarkRed),
          errorBorder: buildInputBorder(1.w, AppColors.secondaryDarkRed),
        ),
      ),
    );
  }

  TextStyle appTextStyle(final FontWeight? fontWeight) {
    return TextStyle(
        fontSize: 14.sp,
        fontFamily: "WorkSans",
        fontWeight: fontWeight,
        color: AppColors.secondary);
  }
}

OutlineInputBorder buildInputBorder(double width, Color color) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: width, color: color));
}
