import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/widgets/custom_text_body.dart';

import '../../../../../core/helpers/app_colors.dart';
import '../../../../../core/helpers/utils.dart';
import '../../../../../widgets/custom_image.dart';

class HealthyRecipes extends StatelessWidget {
  const HealthyRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 380.h, right: 30.w),
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("background_cth"),
              width: 282.w,
              height: 150.h),
        ),
        Positioned(
          top: 95.h,
          left: 50.w,
          right: 50.w,
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("freepik _character"),
              width: 175,
              height: 188),
        ),
        Container(
          width: 200.w,
          margin: EdgeInsets.only(bottom: 215.h),
          child: Divider(
            color: AppColors.primaryDarkGreen900OP,
          ),
        ),
        Positioned(
          top: 210.h,
          right: 100.w,
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("Jars"),
              width: 38.5.w,
              height: 28.h),
        ),
        Positioned(
          top: 150.h,
          right: 156.w,
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("freepik_cooking"),
              width: 155.5.w,
              height: 90.h),
        ),
        Positioned(
            top: 285.h,
            child: const CustomTextBody(
                text: "Healthy Recipes",
                title: "Browse thousands of healthy",
                subTitle: "recipes from all over the world."))
      ],
    );
  }
}
