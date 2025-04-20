import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/models/deatails_variables.dart';
import 'package:kcal/widgets/custom_app_bar.dart';
import 'package:kcal/widgets/custom_button.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/custom_text.dart';
import 'package:kcal/widgets/custom_text_body.dart';

class PremiumView extends StatefulWidget {
  const PremiumView({super.key});

  @override
  State<PremiumView> createState() => _PremiumViewState();
}

int index = 1;

class _PremiumViewState extends State<PremiumView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 13.h),
          SafeArea(
            child: CustomAppBar(
              title: "Buy Premium",
              tapBack: () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24).w,
              children: [
                SizedBox(height: 24.h),
                Center(
                  child: CustomText(
                      color: AppColors.title,
                      letterSpacing: 0.4.sp,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "WorkSans",
                      text: ""),
                ),
                Center(
                  child: CustomText(
                      color: AppColors.subTitle100,
                      letterSpacing: 0.4.sp,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "WorkSans",
                      textSpan: "Premium Features"),
                ),
                SizedBox(height: 24.h),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32).w,
                  width: 280.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32).r,
                    color: AppColors.primaryLightGreen100,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        3,
                        (index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  CustomImageWidget(
                                    image: Utils.getAssetPNGPath("done"),
                                    width: 16.w,
                                    height: 16.w,
                                  ),
                                  SizedBox(width: 8.w),
                                  CustomText(
                                    letterSpacing: 0.1.sp,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "WorkSans",
                                    text: subscriptionTitle[index],
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.w),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                Center(
                  child: CustomText(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "WorkSans",
                      text: "Choose Your Plan"),
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Radio(
                        activeColor: AppColors.primary,
                        value: index,
                        groupValue: 0,
                        onChanged: (value) {
                          setState(() {
                            index = 0;
                          });
                        }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            color: AppColors.subTitle400,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "WorkSans",
                            text: "Monthly - \$7.99/month"),
                        CustomText(
                            color: AppColors.subTitle100,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: "WorkSans",
                            text: "Try Free For 7 Days Only"),
                      ],
                    ),
                    const Spacer(),
                    index == 0
                        ? CustomButton(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            height: 25.h,
                            width: 85.w,
                            text: "Save 10%",
                            onTap: () {})
                        : const SizedBox.shrink(),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Radio(
                        activeColor: AppColors.primary,
                        value: index,
                        groupValue: 1,
                        onChanged: (value) {
                          setState(() {
                            index = 1;
                          });
                        }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            color: AppColors.subTitle400,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "WorkSans",
                            text: "Annual -  \$49.99/year"),
                        CustomText(
                            color: AppColors.subTitle100,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: "WorkSans",
                            text: "Try Free For 7 Days Only"),
                      ],
                    ),
                    const Spacer(),
                    index == 1
                        ? CustomButton(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            height: 25.h,
                            width: 85.w,
                            text: "Save 25%",
                            onTap: () {})
                        : const SizedBox.shrink(),
                  ],
                ),
                SizedBox(height: 44.h),
                CustomButton(
                  text: "Subscribe",
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.subscriptions);
                  },
                ),
                SizedBox(height: 16.h),
                CustomTextBody(
                    color: AppColors.subTitle100,
                    fontSizeSmall: 14.sp,
                    changeFontSize: true,
                    text: "",
                    title: "Subscriptions will be auto-renewed.",
                    subTitle: "Cancel Anytime. Safe & Secure Payments.")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
