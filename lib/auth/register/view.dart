import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/widgets/custom_button.dart';
import 'package:kcal/widgets/custom_text_form.dart';
import 'package:kcal/widgets/title_text_field.dart';

import '../../core/helpers/app_colors.dart';
import '../../core/helpers/utils.dart';
import '../../widgets/custom_auth_header.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        children: [
          const CustomAuthHeader(
              text: "The Basics",
              title: "Let’s start with the basics. Note: you",
              subTitle: "cannot change these details later.    ",
              pageNumber: "1/4"),
          SizedBox(
            height: 30.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleTextField(
                text: "Full Name",
              ),
              Container(
                  margin: EdgeInsets.only(
                    top: 8.h,
                  ),
                  child: CustomTextForm(
                    fontWeight: FontWeight.w400,
                    hintText: "User Name",
                    image: Utils.getAssetPNGPath("user"),
                  )),
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
                  margin: EdgeInsets.only(top: 8.h, bottom: 24.h),
                  child: CustomTextForm(
                    fontWeight: FontWeight.w400,
                    hintText: "Enter Your Password",
                    image: Utils.getAssetPNGPath("lock"),
                    suffix: InkWell(
                      onTap: () {},
                      child: CustomImageWidget(
                          image: Utils.getAssetPNGPath("eye"),
                          width: 24,
                          height: 24),
                    ),
                    obscureText: true,
                  )),
              Center(
                  child: CustomButton(
                      text: "Next",
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.pickPhoto);
                      })),
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 16.h),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.login);
              },
              child: CustomText(
                text: "Already Have An Acount? ",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "WorkSans",
                color: AppColors.secondary,
                textSpan: "Log In",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
