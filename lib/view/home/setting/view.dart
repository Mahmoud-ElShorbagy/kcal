import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/view/app_tap_bar/cubit.dart';
import 'package:kcal/widgets/build_row_setting.dart';
import 'package:kcal/widgets/custom_app_bar.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

List<bool> isPressedList = List.generate(3, (index) => false);

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextChangeCubit(),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 13.h),
            SafeArea(
                child: CustomAppBar(
                    tapBack: () {
                      Navigator.pop(context);
                    },
                    title: "Settings")),
            SizedBox(height: 40.h),
            CustomBuildRowSetting(
              onTap: () {},
              imageIcon: "language",
              text: "Language",
              image: "foraward_grey",
            ),
            SizedBox(height: 16.h),
            CustomBuildRowSetting(
              onTap: () {
                setState(() {
                  isPressedList[0] = !isPressedList[0];
                });
              },
              imageIcon: "theme",
              text: "Dark Mode",
              image: isPressedList[0] ? "switch_enabled" : "switch_disable",
              width: 56.w,
              height: 32.h,
            ),
            SizedBox(height: 16.h),
            CustomBuildRowSetting(
              width: 56.w,
              height: 32.h,
              onTap: () {
                setState(() {
                  isPressedList[1] = !isPressedList[1];
                });
              },
              imageIcon: "location",
              text: "Location",
              image: isPressedList[1] ? "switch_enabled" : "switch_disable",
            ),
            SizedBox(height: 16.h),
            CustomBuildRowSetting(
              width: 56.w,
              height: 32.h,
              onTap: () {
                setState(() {
                  isPressedList[2] = !isPressedList[2];
                });
              },
              imageIcon: "notifications",
              text: "Notifications",
              image: isPressedList[2] ? "switch_disable" : "switch_enabled",
            ),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              thickness: 1.5.sp,
              color: AppColors.accentGrayLight50,
            ),
            SizedBox(height: 16.h),
            CustomBuildRowSetting(
              onTap: () {},
              imageIcon: "help_center",
              text: "Help Center",
              image: "foraward_grey",
            ),
            SizedBox(height: 16.h),
            CustomBuildRowSetting(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.login);
              },
              imageIcon: "log_out",
              text: "Log Out",
              image: "foraward_red",
            ),
          ],
        ),
      ),
    );
  }
}
