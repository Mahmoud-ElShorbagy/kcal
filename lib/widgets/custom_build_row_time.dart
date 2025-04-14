import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/widgets/custom_text.dart';

import '../core/helpers/app_colors.dart';

Widget buildRowTime(final String time, final Color? backgroundColor,
    final Color? textColor, void Function()? onTap) {
  return Row(
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: 73.w,
          height: 35.h,
          decoration: BoxDecoration(
              border:
                  Border.all(width: 2, color: AppColors.primaryLightGreen250),
              borderRadius: BorderRadius.circular(16).r,
              color: backgroundColor),
          child: CustomText(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            fontFamily: "WorkSans",
            text: time,
            color: textColor,
          ),
        ),
      ),
      SizedBox(
        width: 4.w,
      )
    ],
  );
}
