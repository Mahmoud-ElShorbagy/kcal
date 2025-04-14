import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/view/product_recipes/units/product_lable_list.dart';
import 'package:kcal/widgets/custom_text.dart';

class StepsRecipesView extends StatelessWidget {
  const StepsRecipesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          letterSpacing: 0.4.sp,
          color: AppColors.subTitle400,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "WorkSans",
          text: "Ingredients",
        ),
        SizedBox(height: 13.h),
        const ProductLableList(),
        SizedBox(height: 28.h),
        CustomText(
          letterSpacing: 0.4.sp,
          color: AppColors.subTitle400,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "WorkSans",
          text: "Directions",
        ),
        SizedBox(height: 13.h),
        CustomText(
          letterSpacing: 0.1.sp,
          color: AppColors.secondaryText,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "WorkSans",
          text: "Step 1",
        ),
        SizedBox(height: 8.h),
        CustomText(
          letterSpacing: 0.1.sp,
          color: AppColors.secondaryText,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "WorkSans",
          text: "Preheat a grill for high heat.",
        ),
        SizedBox(height: 13.h),
        CustomText(
          letterSpacing: 0.1.sp,
          color: AppColors.secondaryText,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "WorkSans",
          text: "Step 2",
        ),
        SizedBox(height: 8.h),
        CustomText(
          height: 1.7.sp,
          letterSpacing: 0.1.sp,
          color: AppColors.secondaryText,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "WorkSans",
          text:
              "In a large bowl, mix together the ground beef, onion, cheese, soy sauce, Worcestershire sauce, egg, onion soup mix, garlic, garlic powder, parsley, basil, oregano, rosemary, salt, and pepper. Form into 4 patties.",
        ),
        SizedBox(height: 13.h),
        CustomText(
          letterSpacing: 0.1.sp,
          color: AppColors.secondaryText,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "WorkSans",
          text: "Step 3",
        ),
        SizedBox(height: 8.h),
        CustomText(
          height: 1.7.sp,
          letterSpacing: 0.1.sp,
          color: AppColors.secondaryText,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "WorkSans",
          text:
              "Grill patties for 5 minutes per side on the hot grill, or until well done. Serve on buns with your favorite condiments.",
        ),
      ],
    );
  }
}
