import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/widgets/custom_text_body.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../../core/helpers/utils.dart';
import '../../../../widgets/custom_image.dart';

class TrackHealth extends StatelessWidget {
  const TrackHealth({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 425.h, right: 90.w, left: 90.w),
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("background_complete"),
              width: 233.4131317138672.w,
              height: 135.778076171875.h),
        ),
        Container(
          width: 165.w,
          margin: EdgeInsets.only(bottom: 260.h),
          child: Divider(
            color: AppColors.primaryDarkGreen900OP,
          ),
        ),
        Positioned(
          top: 233.h,
          left: 90.w,
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("freepik_shadow"),
              width: 224.5.w,
              height: 22.h),
        ),
        Positioned(
          top: 152.h,
          right: 220.w,
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("Plant"), width: 51.w, height: 63.h),
        ),
        Positioned(
          top: 88.w,
          right: 125.w,
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("freepik_device"),
              width: 110.5.w,
              height: 165.h),
        ),
        Positioned(
          top: 95.h,
          left: 150.w,
          right: 50.w,
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("character_inject"),
              width: 73.443603515625.w,
              height: 148.55897521972656.h),
        ),
        Positioned(
            top: 285.h,
            child: const CustomTextBody(
                text: "Track Your Health",
                title: "With amazing inbuilt tools you",
                subTitle: "can track your progress."))
      ],
    );
  }
}
