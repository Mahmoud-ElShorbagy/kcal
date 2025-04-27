import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/auth/manager/manage_state_handler.dart';
import 'package:kcal/auth/password_visibility/cubit.dart';
import 'package:kcal/auth/register/cubit.dart';
import 'package:kcal/core/helpers/validators.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/view/navigate_to_page/view.dart';
import 'package:kcal/widgets/custom_button.dart';
import 'package:kcal/widgets/custom_text_form.dart';
import 'package:kcal/widgets/title_text_field.dart';
import '../../core/helpers/app_colors.dart';
import '../../core/helpers/utils.dart';
import '../../widgets/custom_auth_header.dart';
import '../../widgets/custom_image.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => PasswordVisibilityCubit(),
        ),
      ],
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          ManageStateHandler.manageRegisterState(state, context);
        },
        builder: (context, state) {
          final bool absorbing =
              state is RegisterLoading || state is RegisterSuccess;
          final cubit = RegisterCubit.get(context);
          return Scaffold(
            body: AbsorbPointer(
              absorbing: absorbing,
              child: ListView(
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
                  Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: cubit.formKey,
                    child: Column(
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
                              validator: (v) => Validators.validateName(v!),
                              onChanged: (v) {
                                cubit.updateValidateName(v);
                              },
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
                              validator: (v) => Validators.validateEmail(v!),
                              onChanged: (v) {
                                cubit.updateValidateEmail(v);
                              },
                              controller: cubit.emailController,
                              fontWeight: FontWeight.w400,
                              hintText: "Enter Your Email Address",
                              image: Utils.getAssetPNGPath("email"),
                            )),
                        const TitleTextField(
                          text: "Password",
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 8.h, bottom: 24.h),
                            child: BlocBuilder<PasswordVisibilityCubit,
                                PasswordVisibilityState>(
                              builder: (context, state) {
                                final visibilityCubit =
                                    PasswordVisibilityCubit.get(context);
                                return CustomTextForm(
                                  validator: (v) =>
                                      Validators.validatePassword(v!),
                                  onChanged: (v) {
                                    cubit.updateValidatePassword(v);
                                  },
                                  controller: cubit.passwordController,
                                  fontWeight: FontWeight.w400,
                                  hintText: "Enter Your Password",
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
                        Center(
                            child: CustomButton(
                                color: cubit.isFormValid
                                    ? AppColors.primary
                                    : AppColors.subTitle100,
                                text: "Next",
                                onTap: () async {
                                  cubit.register();
                                })),
                      ],
                    ),
                  ),
                  NavigateToPage.navigateToPage(context, () {
                    Navigator.pushNamed(context, RouteNames.login);
                  }, "Already Have An Acount? ", "Log In"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
