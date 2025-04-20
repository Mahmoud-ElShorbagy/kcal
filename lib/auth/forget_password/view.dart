import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/auth/forget_password/cubit.dart';
import 'package:kcal/auth/manager/manage_state_handler.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/core/helpers/validators.dart';
import 'package:kcal/view/navigate_to_page/view.dart';
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
    return BlocProvider(
      create: (context) => ForgetpasswordCubit(),
      child: Scaffold(
        body: BlocConsumer<ForgetpasswordCubit, ForgetpasswordState>(
          builder: (context, state) {
            final cubit = ForgetpasswordCubit.get(context);
            return ListView(
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
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: cubit.formKey,
                  child: CustomTextForm(
                    controller: cubit.emailController,
                    validator: (v) {
                      return Validators.validateEmail(v);
                    },
                    hintText: "Enter Your Email Address",
                    image: Utils.getAssetPNGPath("email"),
                    bottom: 13.h,
                  ),
                ),
                NavigateToPage.navigateToPage(context, () {
                  Navigator.pushNamed(context, RouteNames.login);
                }, "Remember Password? ", "Log In"),
                SizedBox(height: 40.h),
                Center(
                    child: CustomButton(
                        text: "Send",
                        onTap: () {
                          cubit.forgetPassword();
                        })),
                SizedBox(height: 16.h),
                NavigateToPage.navigateToPage(context, () {
                  Navigator.pushNamed(context, RouteNames.register);
                }, "Don’t Have An Acount? ", "Sign Up")
              ],
            );
          },
          listener: (BuildContext context, state) {
            ManageStateHandler.manageForgetPasswordState(state, context);
          },
        ),
      ),
    );
  }
}
