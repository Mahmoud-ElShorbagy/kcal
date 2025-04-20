import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/auth/login/cubit.dart';
import 'package:kcal/auth/login_facebook/view.dart';
import 'package:kcal/auth/login_google/view.dart';
import 'package:kcal/auth/manager/manage_state_handler.dart';
import 'package:kcal/auth/password_visibility/cubit.dart';
import 'package:kcal/core/helpers/validators.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/view/navigate_to_page/view.dart';
import 'package:kcal/widgets/app/build_row_divider.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/custom_logo.dart';

import '../../core/helpers/app_colors.dart';
import '../../core/helpers/utils.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form.dart';
import '../../widgets/title_text_field.dart';

bool absorbing = false;

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
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => LoginCubit(),
              ),
              BlocProvider(
                create: (context) => PasswordVisibilityCubit(),
              ),
            ],
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                ManageStateHandler.manageLoginState(state, context);
              },
              builder: (context, state) {
                final bool isLoginSuccess = state is LoginSuccess;

                final loginCubit = LoginCubit.get(context);
                return Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: loginCubit.formKey,
                  child: AbsorbPointer(
                    absorbing: isLoginSuccess,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LoginWithFacebookView(),
                        const LoginWithGoogleView(),
                        SizedBox(
                          height: 32.h,
                        ),
                        const BuildRowDivider(),
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
                              validator: (v) => Validators.validateEmail(v),
                              controller: loginCubit.emailController,
                              fontWeight: FontWeight.w400,
                              hintText: "Enter Your Email Address",
                              image: Utils.getAssetPNGPath("email"),
                              onChanged: (v) {
                                loginCubit.updateValidateEmail(v);
                              },
                            )),
                        const TitleTextField(
                          text: "Password",
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              top: 8.h,
                            ),
                            child: BlocBuilder<PasswordVisibilityCubit,
                                PasswordVisibilityState>(
                              builder: (context, state) {
                                final visibilityCubit =
                                    PasswordVisibilityCubit.get(context);
                                return CustomTextForm(
                                  validator: (v) =>
                                      Validators.validatePassword(v),
                                  controller: loginCubit.passwordController,
                                  fontWeight: FontWeight.w400,
                                  bottom: 0,
                                  hintText: "Enter Your Password",
                                  onChanged: (v) =>
                                      loginCubit.updateValidatePassword(v),
                                  image: Utils.getAssetPNGPath("lock"),
                                  suffix: InkWell(
                                    onTap: () {
                                      visibilityCubit
                                          .changePasswordVisibility();
                                    },
                                    child: visibilityCubit.isPassword
                                        ? const Icon(
                                            size: 24,
                                            Icons.visibility_off,
                                            color: AppColors.dividerColor,
                                          )
                                        : CustomImageWidget(
                                            image: Utils.getAssetPNGPath("eye"),
                                            width: 24.w,
                                            height: 24.h),
                                  ),
                                  obscureText: visibilityCubit.isPassword,
                                );
                              },
                            )),
                        NavigateToPage.navigate(context, () {
                          Navigator.pushNamed(
                              context, RouteNames.forgetPassword);
                        }, EdgeInsets.only(bottom: 35.h), "Forgot Password?",
                            Alignment.topRight),
                        Center(
                            child: CustomButton(
                                color: loginCubit.isFormValid
                                    ? AppColors.primary
                                    : AppColors.subTitle100,
                                text: "Login",
                                onTap: () {
                                  loginCubit.login();
                                })),
                        NavigateToPage.navigateToPage(context, () {
                          Navigator.pushNamed(context, RouteNames.register);
                        }, "Don’t Have An Acount? ", "Sign Up")
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
