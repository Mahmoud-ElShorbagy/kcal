import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helpers/app_colors.dart';
import '../../core/helpers/utils.dart';
import '../custom_image.dart';
import '../custom_text.dart';

class CutsomProductList extends StatelessWidget {
  const CutsomProductList({
    super.key,
    required this.image,
    required this.text,
    this.onTap,
  });
  final String image;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Material(
          color: Colors.transparent,
          child: InkWell(
            highlightColor: AppColors.textPrimary500.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(16).r,
            onTap: onTap,
            child: Ink(
              width: 152.w,
              height: 72.h,
              decoration: BoxDecoration(
                color: AppColors.accentYellowLight100,
                borderRadius: BorderRadius.circular(16).r,
              ),
              child: Row(
                children: [
                  CustomImageWidget(image: image, width: 40.w, height: 40.h),
                  SizedBox(width: 8.w),
                  CustomText(
                    letterSpacing: 0.4.sp,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "WorkSans",
                    text: text,
                    color: AppColors.accentYellowDark900,
                  ),
                  const Spacer(),
                  CustomImageWidget(
                      image: Utils.getAssetPNGPath("foaward"),
                      width: 24.w,
                      height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
