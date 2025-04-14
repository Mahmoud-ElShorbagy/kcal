import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/models/title_trend_variables.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/custom_text.dart';

class TrendingFoodsView extends StatelessWidget {
  const TrendingFoodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(titleTrend.length, (index) {
          return CustomTitleTrending(
            onTap: () {},
            title: titleTrend[index],
            image: imageTrend[index],
          );
        })
      ],
    );
  }
}

class CustomTitleTrending extends StatelessWidget {
  const CustomTitleTrending(
      {super.key, required this.title, required this.image, this.onTap});
  final String title;
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 16.h,
      ),
      InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CustomText(
                color: AppColors.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: "WorkSans",
                text: title),
            SizedBox(width: 8.w),
            CustomImageWidget(image: image, width: 16.w, height: 16.h),
          ],
        ),
      ),
      SizedBox(
        height: 16.h,
      ),
      Divider(
        thickness: 1.5.sp,
        color: AppColors.accentGrayLight50,
      )
    ]);
  }
}
