import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/widgets/custom_text.dart';

import '../core/helpers/app_colors.dart';

Widget buildFinalReuilt() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 16.h),
    alignment: Alignment.center,
    child: CustomText(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontFamily: "WorkSans",
        text: "This is the final result..",
        color: AppColors.subTitle400),
  );
}
