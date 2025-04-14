import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/widgets/custom_image.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 485.h),
      width: 375.w,
      height: 140.h,
      decoration: BoxDecoration(
          color: AppColors.primaryDarkGreen900OP,
          borderRadius:
              BorderRadius.vertical(top: const Radius.circular(32).r)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 112.w),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageWidget(
                    image: Utils.getAssetPNGPath("camera_active"),
                    width: 65.w,
                    height: 60.h,
                  ),
                  CustomImageWidget(
                    image: Utils.getAssetPNGPath("Ellipse 7"),
                    width: 40.w,
                    height: 33.h,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: 28.w,
              height: 28.h,
              decoration: BoxDecoration(
                color: AppColors.accentYellowLight100,
                borderRadius: BorderRadius.circular(8).r,
              ),
              child: CustomImageWidget(
                image: Utils.getAssetPNGPath("relod"),
                width: 23.w,
                height: 25.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
