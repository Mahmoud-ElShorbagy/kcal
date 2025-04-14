import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/custom_logo.dart';

import '../../core/helpers/app_colors.dart';
import '../../core/helpers/utils.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form.dart';
import '../../widgets/title_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        children: [
          CustomLogoImage(
            margin: EdgeInsets.only(top: 65.h, bottom: 38.h),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerLeft,
                children: [
                  CustomButton(
                    text: "       Continue with Facebook",
                    onTap: () {},
                    borderRadius: 10.r,
                    color: AppColors.blue,
                    height: 40.h,
                    width: 319.w,
                    fontWeight: FontWeight.w700,
                    fontSize: 17.5.sp,
                  ),
                  Positioned(
                    left: 20.w,
                    child: CustomImageWidget(
                        image: Utils.getAssetPNGPath("Facebook_logo"),
                        width: 24.w,
                        height: 24.w),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                          color: AppColors.borderGreyLight100, width: 1.w),
                    ),
                    child: CustomButton(
                      text: "       Continue with Google",
                      onTap: () {},
                      borderRadius: 10.r,
                      color: AppColors.white,
                      height: 40.h,
                      width: 319.w,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.5.sp,
                      textColor: AppColors.accentGrayDark700,
                    ),
                  ),
                  Positioned(
                    top: 30.h,
                    left: 20.w,
                    child: CustomImageWidget(
                        image: Utils.getAssetPNGPath("Google_logo"),
                        width: 24.w,
                        height: 24.w),
                  )
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              const Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: AppColors.dividerColor,
                  )),
                  CustomText(
                      text: "   OR   ",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "WorkSans",
                      color: AppColors.dividerColor),
                  Expanded(
                      child: Divider(
                    color: AppColors.dividerColor,
                  )),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              const TitleTextField(
                text: "Email Address",
              ),
              Container(
                  margin: EdgeInsets.only(
                    top: 8.h,
                  ),
                  child: CustomTextForm(
                    fontWeight: FontWeight.w400,
                    hintText: "Enter Your Email Address",
                    image: Utils.getAssetPNGPath("email"),
                  )),
              const TitleTextField(
                text: "Password",
              ),
              Container(
                  margin: EdgeInsets.only(
                    top: 8.h,
                  ),
                  child: CustomTextForm(
                    fontWeight: FontWeight.w400,
                    bottom: 0,
                    hintText: "Enter Your Password",
                    image: Utils.getAssetPNGPath("lock"),
                    suffix: InkWell(
                      onTap: () {},
                      child: CustomImageWidget(
                          image: Utils.getAssetPNGPath("eye"),
                          width: 24.w,
                          height: 24.h),
                    ),
                    obscureText: true,
                  )),
              Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(bottom: 35.h),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.forgetPassword);
                  },
                  child: CustomText(
                      text: "Forgot Password?",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "WorkSans",
                      color: AppColors.darkGreen600),
                ),
              ),
              Center(
                  child: CustomButton(
                      text: "Login",
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteNames.appBottomNavigationBar);
                      })),
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 16.h),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.register);
              },
              child: CustomText(
                text: "Already Have An Acount? ",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "WorkSans",
                color: AppColors.secondary,
                textSpan: "Sign Up",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//final String email = ModalRoute.of(context)!.settings.arguments as String;
