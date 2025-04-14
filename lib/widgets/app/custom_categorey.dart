import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/widgets/custom_text.dart';

import '../custom_button.dart';
import '../custom_image.dart';

class CustomCategoreyPage extends StatelessWidget {
  final String title;
  final String content;
  final String titleButton;
  final String image;
  final void Function()? onTap;
  const CustomCategoreyPage({
    super.key,
    required this.title,
    required this.content,
    required this.titleButton,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      padding: const EdgeInsets.only(top: 22, left: 24, right: 16).w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32).r,
        color: AppColors.primaryLightGreen100,
      ),
      width: 320.w,
      height: 132.h,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                color: AppColors.textPrimary100,
                letterSpacing: 0.3.sp,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                fontFamily: "WorkSans",
                text: title,
              ),
              CustomText(
                color: AppColors.primaryDarkGreen900,
                letterSpacing: 0.3.sp,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "WorkSans",
                text: content,
              ),
              SizedBox(height: 8.h),
              CustomButton(
                width: 112.w,
                height: 28.h,
                fontSize: 12.5.sp,
                borderRadius: 12.r,
                text: titleButton,
                onTap: onTap,
              )
            ],
          ),
          const Spacer(),
          CustomImageWidget(image: image, width: 80.w, height: 92.h)
        ],
      ),
    );
  }
}
