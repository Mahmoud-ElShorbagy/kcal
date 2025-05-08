import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/widgets/custom_build_row_deatails.dart';
import 'package:kcal/widgets/custom_text.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/utils.dart';
import '../../../widgets/custom_image.dart';

class CustomRecipesPageView extends StatelessWidget {
  const CustomRecipesPageView({
    super.key,
    required this.imageFood,
    this.onTap,
    required this.textTime,
    required this.serve,
    required this.title,
    required this.content,
  });
  final String imageFood;
  final void Function()? onTap;
  final String textTime;
  final String serve;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        highlightColor: AppColors.textPrimary500.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(24).r,
        child: Column(
          children: [
            Stack(
              children: [
                CustomImageWidget(
                  image: Utils.getAssetPNGPath(imageFood),
                  width: 327.w,
                  height: 150.h,
                ),
                Positioned(
                  right: 20.w,
                  top: 20.h,
                  child: CustomImageWidget(
                    image: Utils.getAssetPNGPath("Icon_heart"),
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ],
            ),
            Ink(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              width: 327.w,
              height: 120.h,
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(24))
                          .r,
                  color: AppColors.accentYellowLight100),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    buildRowDetailsRecipes(textTime, serve),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 40.w),
                      child: CustomText(
                        letterSpacing: 0.36.sp,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "WorkSans",
                        text: title,
                        color: AppColors.title,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomText(
                      letterSpacing: 0.36.sp,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "WorkSans",
                      text: content,
                      color: AppColors.secondaryText,
                    ),
                  ]),
            ),
            SizedBox(
              height: 13.w,
            )
          ],
        ),
      ),
    );
  }
}
