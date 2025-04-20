import 'package:flutter/material.dart';
import 'package:kcal/auth/forget_password/cubit.dart';
import 'package:kcal/auth/login/cubit.dart';
import 'package:kcal/auth/register/cubit.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/widgets/alerting_loading.dart';
import 'package:kcal/widgets/app/app_snack_bar.dart';

class ManageStateHandler {
  static void manageRegisterState(RegisterState state, BuildContext context) {
    if (state is RegisterSuccess) {
      appSnackBar(context, state.message, AppColors.primaryBaseGreen);
      Navigator.pushReplacementNamed(context, RouteNames.pickPhoto);
    } else if (state is RegisterError) {
      appSnackBar(context, state.message, AppColors.red);
    } else if (state is RegisterFailure) {
      appSnackBar(context, state.message, AppColors.red);
    } else if (state is RegisterLoading) {
      AlertingLoading.showLoading(
        seconds: 2,
        context,
      );
    }
  }

  static void manageLoginState(LoginState state, BuildContext context) {
    if (state is LoginSuccess) {
      appSnackBar(context, state.message, AppColors.primaryBaseGreen,
          seconds: 3);
      Navigator.pushReplacementNamed(
          context, RouteNames.appBottomNavigationBar);
    } else if (state is SendVerification) {
      appSnackBar(
        context,
        state.message,
        AppColors.yellow,
      );
    } else if (state is LoginError) {
      appSnackBar(
        context,
        state.message,
        AppColors.red,
      );
    } else if (state is LoginFailure) {
      appSnackBar(
        context,
        state.message,
        AppColors.red,
      );
    } else if (state is LoginLoading) {
      AlertingLoading.showLoading(
        seconds: 2,
        context,
      );
    }
  }

  static void manageForgetPasswordState(
      ForgetpasswordState state, BuildContext context) {
    if (state is ForgetpasswordLoading) {
      AlertingLoading.showLoading(
        seconds: 1,
        context,
      );
    } else if (state is ForgetpasswordSuccess) {
      appSnackBar(context, state.message, AppColors.primaryBaseGreen);
      Navigator.pushNamed(context, RouteNames.emailSent);
    } else if (state is ForgetpasswordError) {
      appSnackBar(context, state.message, AppColors.red);
    }
  }
}
