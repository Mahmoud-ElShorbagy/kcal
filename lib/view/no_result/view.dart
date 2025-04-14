import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/widgets/custom_image.dart';

import '../../core/helpers/app_colors.dart';
import '../../core/helpers/utils.dart';
import '../../widgets/custom_text.dart';

class CustomNoResultPage extends StatelessWidget {
  const CustomNoResultPage(
      {super.key,
      required this.image,
      this.text,
      required this.title,
      required this.subTitle,
      this.width = 96,
      this.height = 75});
  final double width;
  final double height;
  final String image;
  final String? text;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        CustomImageWidget(
            image: Utils.getAssetSVGPath(image),
            width: width.w,
            height: height.h),
        SizedBox(
          height: 21.h,
        ),
        CustomText(
          letterSpacing: 0.4.sp,
          fontSize: 19.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "WorkSans",
          text: text,
          color: AppColors.subTitle400,
        ),
        SizedBox(
          height: 8.h,
        ),
        CustomText(
          letterSpacing: 0.1.sp,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "WorkSans",
          text: title,
          color: AppColors.secondaryText,
        ),
        CustomText(
          letterSpacing: 0.1.sp,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "WorkSans",
          text: subTitle,
          color: AppColors.secondaryText,
        ),
      ],
    );
  }
}
