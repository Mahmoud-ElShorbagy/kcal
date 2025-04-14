import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/widgets/custom_text.dart';

Widget buildDetaislProduct() {
  return CustomText(
    height: 1.7.sp,
    letterSpacing: 0.1.sp,
    color: AppColors.secondaryText,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "WorkSans",
    text:
        "A hamburger (also burger for short) is a food, typically considered a sandwich, consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled",
  );
}
