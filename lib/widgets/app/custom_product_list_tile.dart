import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/custom_text.dart';

class CustomProductListTile extends StatelessWidget {
  const CustomProductListTile({
    super.key,
    required this.imageProduct,
    required this.text,
    required this.title,
  });

  final String imageProduct;
  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CustomImageWidget(
        image: imageProduct,
        width: 55.w,
        height: 55.h,
      ),
      SizedBox(width: 16.w),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            letterSpacing: 0.4.sp,
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "WorkSans",
            text: text,
            color: AppColors.accentYellowDark700,
          ),
          CustomText(
            letterSpacing: 0.3.sp,
            fontSize: 12.5.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "WorkSans",
            text: title,
            color: AppColors.accentYellowDark900,
          ),
        ],
      )
    ]);
  }
}
