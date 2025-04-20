import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/route_utils/route_utils.dart';
import 'package:kcal/widgets/circular_indicator.dart';
import 'package:kcal/widgets/custom_button.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/custom_text.dart';

class AlertingLoading extends StatelessWidget {
  const AlertingLoading({super.key, this.seconds = 2});
  final int seconds;
  static void showAlert(BuildContext context, String message) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Align(
            alignment: Alignment.center,
            child: Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(16).r,
              child: Container(
                width: 320.w,
                height: 280.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(children: [
                  CustomImageWidget(
                      image: "assets/images/png/alert.png",
                      width: 100.w,
                      height: 100.h),
                  CustomText(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "WorkSans",
                      text: message,
                      color: AppColors.black),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomButton(
                    height: 40.h,
                    text: "Log out",
                    onTap: () async {
                      RouteUtils.signOut(context);
                    },
                    color: const Color.fromARGB(255, 249, 36, 36),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomButton(
                    height: 40.h,
                    text: "Close",
                    onTap: () {
                      Navigator.pop(context);
                    },
                    color: AppColors.primaryBaseGreen,
                  )
                ]),
              ),
            ),
          );
        });
  }

  static void showLoading(BuildContext context, {int? seconds}) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          Future.delayed(Duration(seconds: seconds ?? 2), () {
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          });
          return Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              width: 90.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16).r,
              ),
              child: const CircularIndicator(
                height: 0,
                mainAxisSize: MainAxisSize.min,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
