import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/custom_text.dart';

Widget buildRowDetailsRecipes(final String textTime, final String serve) {
  return Row(children: [
    CustomImageWidget(
      image: Utils.getAssetPNGPath("watch"),
      width: 16.w,
      height: 16.h,
    ),
    CustomText(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      fontFamily: "WorkSans",
      text: textTime,
      color: AppColors.accentYellowDark900,
    ),
    SizedBox(
      width: 14.w,
    ),
    CustomImageWidget(
      image: Utils.getAssetPNGPath("groub"),
      width: 16.w,
      height: 16.h,
    ),
    CustomText(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      fontFamily: "WorkSans",
      text: serve,
      color: AppColors.accentYellowDark900,
    ),
    const Spacer(),
    for (int i = 0; i < 5; i++) ...[
      CustomImageWidget(
        image: Utils.getAssetPNGPath("star"),
        width: 16.w,
        height: 16.h,
      ),
    ]
  ]);
}
