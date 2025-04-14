import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/view/app_tap_bar/trending_foods/view.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../models/product_variables.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';

class HomeSearchView extends StatelessWidget {
  const HomeSearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      children: [
        CustomText(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "WorkSans",
            text: "Hot Now"),
        SizedBox(height: 16.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(categoryProduct.length, (index) {
                return Row(
                  children: [
                    SizedBox(
                      height: 190.h,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CustomImageWidget(
                              image: categoryProduct[index].imageUrl,
                              width: 200,
                              height: 130.h),
                          Positioned(
                            top: 130.h,
                            child: Container(
                              width: 175.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: AppColors.accentYellowLight100,
                                borderRadius: BorderRadius.vertical(
                                    bottom: const Radius.circular(24).r),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16.w,
                            top: 140.h,
                            child: CustomText(
                              letterSpacing: 0.3.sp,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "WorkSans",
                              text: categoryProduct[index].content,
                              color: AppColors.secondaryDarkRed,
                            ),
                          ),
                          Positioned(
                            left: 16.w,
                            top: 160.h,
                            child: CustomText(
                              letterSpacing: 0.3.sp,
                              fontSize: 12.5.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "WorkSans",
                              text: categoryProduct[index].titleButton,
                              color: AppColors.secondaryDarkRed,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.w),
                  ],
                );
              })
            ],
          ),
        ),
        SizedBox(height: 22.h),
        CustomText(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "WorkSans",
            text: "Trending"),
        const TrendingFoodsView()
      ],
    );
  }
}
