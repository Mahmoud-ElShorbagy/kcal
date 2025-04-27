import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/auth/pick_photo/cubit.dart';
import 'package:kcal/auth/register/cubit.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/view/image_user/view.dart';
import 'package:kcal/widgets/alerting_loading.dart';
import 'package:kcal/widgets/build_row_setting.dart';
import 'package:kcal/widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => ImagePickerCubit(),
        ),
      ],
      child: ListView(
        children: [
          SizedBox(
            height: 13.h,
          ),
          SafeArea(
            child: Center(
              child: CustomText(
                  color: AppColors.black,
                  letterSpacing: 0.3.sp,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "WorkSans",
                  text: "Profile"),
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
          BlocBuilder<ImagePickerCubit, ImagePickerState>(
            builder: (context, state) {
              return ImageUserView(
                imagePath: Utils.imagePath,
              );
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          Center(
            child: BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                final cubit = RegisterCubit.get(context);
                return CustomText(
                    color: AppColors.title,
                    letterSpacing: 0.4.sp,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "WorkSans",
                    text: cubit.userName);
              },
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomBuildRowSetting(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.editProfile);
              },
              imageIcon: "edit",
              text: "Edit Profile",
              image: "foraward_grey"),
          SizedBox(
            height: 16.h,
          ),
          CustomBuildRowSetting(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.premium);
              },
              imageIcon: "subscrip",
              text: "Subscriptions",
              image: "foraward_grey"),
          SizedBox(
            height: 16.h,
          ),
          CustomBuildRowSetting(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.settings);
              },
              imageIcon: "settings",
              text: "Settings",
              image: "foraward_grey"),
          SizedBox(
            height: 16.h,
          ),
          Divider(
            thickness: 1.5.sp,
            color: AppColors.accentGrayLight50,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomBuildRowSetting(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.helpCenter);
              },
              imageIcon: "help_center",
              text: "Help Center",
              image: "foraward_grey"),
          SizedBox(
            height: 16.h,
          ),
          CustomBuildRowSetting(
            onTap: () {
              AlertingLoading.showAlert(context, "Do you want to log out ?");
            },
            imageIcon: "log_out",
            text: "Log Out",
            image: "foraward_red",
            color: AppColors.primary,
          ),
          SizedBox(
            height: 16.h,
          )
        ],
      ),
    );
  }
}
