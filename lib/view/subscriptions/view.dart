import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/auth/register/cubit.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/models/deatails_variables.dart';
import 'package:kcal/view/image_user/view.dart';
import 'package:kcal/widgets/custom_app_bar.dart';
import 'package:kcal/widgets/custom_button.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/custom_text.dart';

class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 13.h),
            SafeArea(
              child: CustomAppBar(
                title: "Subscriptions",
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
                  const ImageUserView(),
                  SizedBox(height: 16.h),
                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      return Center(
                        child: CustomText(
                            color: AppColors.title,
                            letterSpacing: 0.4.sp,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "WorkSans",
                            text: context
                                .read<RegisterCubit>()
                                .nameController
                                .text),
                      );
                    },
                  ),
                  Center(
                    child: CustomText(
                        color: AppColors.subTitle100,
                        letterSpacing: 0.4.sp,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "WorkSans",
                        text: "You’re currently subscribed"),
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
                  SizedBox(
                    height: 15.h,
                  ),
                  Center(
                    child: CustomText(
                        color: AppColors.primary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: "WorkSans",
                        text: "Share the app and get 50% off"),
                  ),
                  SizedBox(
                    height: 54.h,
                  ),
                  CustomButton(
                    text: "Share App",
                    onTap: () {},
                  ),
                  SizedBox(height: 16.h),
                  InkWell(
                    onTap: () {},
                    child: Center(
                      child: CustomText(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "WorkSans",
                          textSpan: "Cancel Subscription"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
