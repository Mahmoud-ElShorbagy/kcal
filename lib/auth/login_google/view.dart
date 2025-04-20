import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/auth/login_google/cubit.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/widgets/alerting_loading.dart';
import 'package:kcal/widgets/app/app_snack_bar.dart';
import 'package:kcal/widgets/custom_button.dart';
import 'package:kcal/widgets/custom_image.dart';

class LoginWithGoogleView extends StatelessWidget {
  const LoginWithGoogleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInGoogleCubit(),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            margin: EdgeInsets.only(top: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border:
                  Border.all(color: AppColors.borderGreyLight100, width: 1.w),
            ),
            child: BlocConsumer<SignInGoogleCubit, SignInGoogleState>(
              listener: (context, state) {
                if (state is SignInGoogleLoading) {
                  AlertingLoading.showLoading(
                    seconds: 1,
                    context,
                  );
                } else if (state is SignInGoogleSuccess) {
                  Navigator.pushNamed(
                      context, RouteNames.appBottomNavigationBar);
                  appSnackBar(
                      context, state.message, AppColors.primaryBaseGreen);
                } else if (state is SignInGoogleError) {
                  appSnackBar(context, state.message, AppColors.red);
                }
              },
              builder: (context, state) {
                final cubit = SignInGoogleCubit.get(context);
                return CustomButton(
                  text: "       Continue with Google",
                  onTap: () {
                    cubit.signInWithGoogle();
                  },
                  borderRadius: 10.r,
                  color: AppColors.white,
                  height: 40.h,
                  width: 319.w,
                  fontWeight: FontWeight.w500,
                  fontSize: 17.5.sp,
                  textColor: AppColors.accentGrayDark700,
                );
              },
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
    );
  }
}
