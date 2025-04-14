import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class TrendingRecipesView extends StatelessWidget {
  const TrendingRecipesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16).r,
        color: AppColors.accentPurple,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20).w,
            child: CustomText(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "WorkSans",
              text: """This Week’s
Trending Recipes""",
            ),
          ),
          CustomButton(
            onTap: () {},
            textColor: AppColors.accentPurple,
            color: AppColors.accentPurpleLight100,
            borderRadius: 12.r,
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
            text: "View",
            width: 100.w,
            height: 28.h,
          )
        ],
      ),
    );
  }
}
