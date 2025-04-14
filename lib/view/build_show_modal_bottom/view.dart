import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helpers/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_close.dart';
import '../../widgets/custom_text.dart';
import '../app_check_box/view.dart';
import '../build_row_time/view.dart';

buildShowModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (context) {
        return Container(
          width: 357.w,
          height: 480.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius:
                BorderRadius.vertical(top: const Radius.circular(24).r),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32.h,
                ),
                CustomIconClose(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    margin: EdgeInsets.zero,
                    title: "Filters",
                    image: "close"),
                SizedBox(
                  height: 32.h,
                ),
                CustomText(
                  letterSpacing: 0.4.sp,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "WorkSans",
                  text: "Cooking Time",
                  color: AppColors.subTitle400,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const BuildRowTimeView(),
                SizedBox(
                  height: 32.h,
                ),
                CustomText(
                  letterSpacing: 0.4.sp,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "WorkSans",
                  text: "Cuisine",
                  color: AppColors.subTitle400,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const AppCheckBoxView(),
                CustomButton(
                    text: "Apply",
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        );
      });
}
