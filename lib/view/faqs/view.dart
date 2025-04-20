import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/widgets/custom_app_bar.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/custom_text.dart';
import 'package:kcal/widgets/custom_text_body.dart';

class FAQSView extends StatelessWidget {
  const FAQSView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 13.h),
          SafeArea(
              child: CustomAppBar(
                  title: "Help Center",
                  tapBack: () {
                    Navigator.pop(context);
                  })),
          SizedBox(height: 13.h),
          Expanded(
              child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  children: [
                CustomImageWidget(
                    image: Utils.getAssetSVGPath("faqs"),
                    width: 282.w,
                    height: 150.h),
                CustomTextBody(
                    changeAxisSize: true,
                    changeFontSize: true,
                    fontSizedBig: 16.sp,
                    fontSizeSmall: 13.sp,
                    text: "What is kcal ?",
                    title:
                        "kcal is a mobile application using which you can search foods and recipes. When you search for foods, you get to know how many calories different foods has. You can also add the recipes and foods you liked the most to your favorites. Beside that you can scan a food in real time and get to know its calories and ingredients.",
                    subTitle: ""),
                CustomText(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "WorkSans",
                  text: "Do I need a subscription?",
                  color: AppColors.subTitle400,
                ),
                SizedBox(height: 16.h),
                const Divider(
                  thickness: 0.2,
                  color: AppColors.dividerColor,
                ),
                SizedBox(height: 16.h),
                CustomText(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "WorkSans",
                  text: "I want to delete my account?",
                  color: AppColors.subTitle400,
                ),
                SizedBox(height: 16.h),
                const Divider(
                  thickness: 0.2,
                  color: AppColors.dividerColor,
                ),
                SizedBox(height: 16.h),
                CustomText(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "WorkSans",
                  text: "Is the scan feature not available for free users?",
                  color: AppColors.subTitle400,
                ),
              ])),
        ],
      ),
    );
  }
}
