import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/widgets/custom_button.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/custom_text_body.dart';
import 'package:kcal/widgets/custom_text_form.dart';
import '../../core/route_utils/route_names.dart';
import '../../widgets/custom_logo.dart';
import '../../widgets/custom_text.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    // final String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        children: [
          CustomLogoImage(
            margin: EdgeInsets.only(top: 65.h, bottom: 38.h),
          ),
          CustomTextBody(
              color: AppColors.secondaryText,
              fontSizedBig: 21.sp,
              fontSizeSmall: 14.sp,
              changeFontSize: true,
              text: 'Forgot Password!',
              title: "Don’t worry! Enter your registered",
              subTitle: "email below to reveive password reset"),
          Container(
            margin: EdgeInsets.only(top: 8.h),
            alignment: Alignment.center,
            child: CustomText(
                text: "instructions.",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                fontFamily: "WorkSans",
                color: AppColors.secondaryText),
          ),
          SizedBox(height: 28.h),
          Align(
            alignment: Alignment.center,
            child: CustomImageWidget(
                image: Utils.getAssetSVGPath("email_sent"),
                width: 125.w,
                height: 103.h),
          ),
          SizedBox(
            height: 27.h,
          ),
          CustomTextForm(
            hintText: "Enter Your Email Address",
            image: Utils.getAssetPNGPath("email"),
            bottom: 13.h,
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.login);
              },
              child: CustomText(
                text: "Remember Password? ",
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "WorkSans",
                color: AppColors.secondary,
                textSpan: "Log In",
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Center(
              child: CustomButton(
                  text: "Send",
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.emailSent);
                  })),
          SizedBox(height: 16.h),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.register);
              },
              child: CustomText(
                text: "Don’t Have An Acount? ",
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
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
