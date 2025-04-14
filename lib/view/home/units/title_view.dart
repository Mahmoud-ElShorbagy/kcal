import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../widgets/custom_text.dart';

class TitleView extends StatelessWidget {
  const TitleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        SafeArea(
          child: CustomText(
            fontSize: 21.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "WorkSans",
            textSpan: "Hello Shambhavi,",
          ),
        ),
        CustomText(
          color: AppColors.subTitle100,
          letterSpacing: 0.3.sp,
          fontSize: 15.5.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "WorkSans",
          text: "Here’s your curated home feed",
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
