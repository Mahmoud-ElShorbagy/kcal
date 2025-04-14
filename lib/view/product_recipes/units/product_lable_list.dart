import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/models/deatails_variables.dart';
import 'package:kcal/widgets/custom_image.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../widgets/custom_text.dart';

class ProductLableList extends StatelessWidget {
  const ProductLableList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            categoreyDetails.length,
            (index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 85.w,
                        height: 75.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16).r,
                            color: AppColors.primaryLightGreen100),
                        child: CustomImageWidget(
                            image: categoreyDetails[index].imageUrl,
                            width: 72.w,
                            height: 72.h),
                      ),
                      SizedBox(
                        width: 8.w,
                      )
                    ],
                  ),
                  SizedBox(height: 8.h),
                  CustomText(
                      letterSpacing: 0.4.sp,
                      color: AppColors.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "WorkSans",
                      text: categoreyDetails[index].titleButton),
                  CustomText(
                    letterSpacing: 0.4.sp,
                    color: AppColors.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "WorkSans",
                    text: categoreyDetails[index].content,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
