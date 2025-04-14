import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/route_utils/route_names.dart';

import '../../core/helpers/app_colors.dart';
import '../../core/helpers/utils.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_logo.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_body.dart';

class EmailSentView extends StatelessWidget {
  const EmailSentView({super.key});

  @override
  Widget build(BuildContext context) {
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
              text: 'Email Sent!',
              title: "We’ve sent a password reset link to",
              subTitle: "sn***ri@gmail.com"),
          const SizedBox(height: 44),
          Align(
            alignment: Alignment.center,
            child: CustomImageWidget(
                image: Utils.getAssetSVGPath("email_sent"),
                width: 260,
                height: 256),
          ),
          SizedBox(
            height: 27.h,
          ),
          Center(
            child: InkWell(
              onTap: () {},
              child: CustomText(
                text: "Didn’t Receive? ",
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "WorkSans",
                color: AppColors.secondary,
                textSpan: "Resend",
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Center(
              child: CustomButton(
                  text: "Back to login",
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.login);
                  })),
          SizedBox(height: 16.h),
          Center(
            child: InkWell(
              onTap: () {},
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
