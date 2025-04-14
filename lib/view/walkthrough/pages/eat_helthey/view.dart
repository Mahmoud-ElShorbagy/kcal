import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../../core/helpers/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text_body.dart';

class EatHelthey extends StatelessWidget {
  const EatHelthey({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 425.h),
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("back_ground"),
              width: 232.4131317138672.w,
              height: 175.778076171875.h),
        ),
        Positioned(
          top: 85.h,
          left: 50.w,
          right: 50.w,
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("freepik"),
              width: 140.443603515625.w,
              height: 155.55897521972656.h),
        ),
        Positioned(
          bottom: 595.h,
          right: 135.w,
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("heart"),
              width: 37.5.w,
              height: 27.h),
        ),
        Positioned(
          top: 240.h,
          left: 160.w,
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("freepik_shadow"),
              width: 136.5.w,
              height: 15.4.h),
        ),
        Container(
          width: 200.w,
          margin: EdgeInsets.only(bottom: 215.h),
          child: Divider(
            color: AppColors.primaryDarkGreen900OP,
          ),
        ),
        Positioned(
          top: 205.h,
          right: 95.w,
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("oil_inject"),
              width: 44.5.w,
              height: 43.h),
        ),
        Positioned(
          top: 200.h,
          right: 174.w,
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("water_inject"),
              width: 20.5.w,
              height: 44.h),
        ),
        Positioned(
          top: 212.h,
          right: 230.w,
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("fruit"),
              width: 60.w,
              height: 28.5.h),
        ),
        Positioned(
          top: 285.h,
          child: const CustomTextBody(
            text: "Eat Healthy",
            title: "Maintaining good health should",
            subTitle: "be the primary focus of everyone.",
          ),
        )
      ],
    );
  }
}
