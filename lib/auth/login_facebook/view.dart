import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/widgets/custom_button.dart';
import 'package:kcal/widgets/custom_image.dart';

class LoginWithFacebookView extends StatelessWidget {
  const LoginWithFacebookView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
