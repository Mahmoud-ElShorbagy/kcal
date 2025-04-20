import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/auth/register/cubit.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/view/app_tap_bar/cubit.dart';
import 'package:kcal/widgets/custom_app_bar.dart';
import 'package:kcal/widgets/custom_button.dart';
import 'package:kcal/widgets/custom_text_body.dart';
import 'package:kcal/widgets/custom_text_form.dart';

class ChatWithUsView extends StatelessWidget {
  const ChatWithUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TextChangeCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      ],
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          final registerCubit = RegisterCubit.get(context);
          final validField = registerCubit.nameController.text.length < 10;
          final textChangeCubit = TextChangeCubit.get(context);
          return BlocBuilder<TextChangeCubit, TextChangeState>(
            builder: (context, state) {
              return Scaffold(
                body: Column(
                  children: [
                    SizedBox(height: 13.h),
                    SafeArea(
                        child: CustomAppBar(
                            title: "Chat With Us",
                            tapBack: () {
                              Navigator.pop(context);
                            })),
                    SizedBox(height: 13.h),
                    Expanded(
                        child: ListView(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            children: [
                          SizedBox(height: 16.h),
                          CustomTextBody(
                              changeAxisSize: true,
                              changeFontSize: true,
                              fontSizedBig: 22.sp,
                              fontSizeSmall: 13.sp,
                              text: "Shoot Us An Email",
                              title:
                                  "Write us an email about anything and we’ll",
                              subTitle: "get back to you within three days."),
                          SizedBox(
                            height: 32.h,
                          ),
                          Form(
                            autovalidateMode: AutovalidateMode.always,
                            key: registerCubit.formKey,
                            child: CustomTextForm(
                              onChanged: (v) {
                                registerCubit.updateValidateName(v);
                              },
                              validator: (v) {
                                if (validField) {
                                  return "Please enter your message";
                                }
                                return null;
                              },
                              hintText: "Enter your message",
                              height: 300.h,
                              maxLines: 15,
                            ),
                          ),
                          Row(
                            children: [
                              CustomButton(
                                onTap: () {
                                  textChangeCubit.updateText(0);
                                },
                                fontWeight: FontWeight.w400,
                                width: 130.w,
                                height: 35.h,
                                fontSize: 16.sp,
                                textColor: AppColors.primaryDarkGreen900,
                                borderColor: AppColors.primaryLightGreen250,
                                text: "Feedback",
                                color: state.activeText == 0
                                    ? AppColors.primaryLightGreen400
                                    : AppColors.primaryLightGreen100,
                              ),
                              SizedBox(
                                width: 11.w,
                              ),
                              CustomButton(
                                onTap: () {
                                  textChangeCubit.updateText(1);
                                },
                                borderColor: AppColors.primaryLightGreen250,
                                fontWeight: FontWeight.w400,
                                width: 130.w,
                                height: 35.h,
                                fontSize: 16.sp,
                                textColor: AppColors.primaryDarkGreen900,
                                text: "Query",
                                color: state.activeText == 1
                                    ? AppColors.primaryLightGreen400
                                    : AppColors.primaryLightGreen100,
                              ),
                            ],
                          ),
                          SizedBox(height: 32.h),
                          CustomButton(
                              color: validField
                                  ? AppColors.subTitle100
                                  : AppColors.primary,
                              text: "Sent",
                              onTap: () {
                                if (registerCubit.formKey.currentState!
                                    .validate()) {
                                  registerCubit.formKey.currentState!.save();
                                  Navigator.pushNamed(
                                      context, RouteNames.message);
                                }
                              })
                        ])),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
