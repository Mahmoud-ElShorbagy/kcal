import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/helpers/app_colors.dart';
import '../core/helpers/utils.dart';
import 'custom_image.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.onTap,
    required this.title,
    this.titleFilter,
    this.tapBack,
  });
  final void Function()? tapBack;
  final void Function()? onTap;
  final String title;
  final String? titleFilter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22).w,
      child: Row(children: [
        InkWell(
          onTap: tapBack,
          child: Row(
            children: [
              CustomImageWidget(
                  image: Utils.getAssetPNGPath("arrow_back"),
                  width: 24.w,
                  height: 24.h),
              SizedBox(
                width: 100.w,
              ),
            ],
          ),
        ),
        CustomText(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "WorkSans",
          text: title,
          color: AppColors.black,
          letterSpacing: 0.3.sp,
        ),
        SizedBox(
          width: 90.w,
        ),
        InkWell(
          onTap: onTap,
          child: CustomText(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            fontFamily: "WorkSans",
            text: titleFilter,
            color: AppColors.primaryBaseGreen,
            letterSpacing: 0.3.sp,
          ),
        ),
      ]),
    );
  }
}
