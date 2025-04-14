import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/widgets/custom_button.dart';
import 'package:kcal/widgets/custom_icon_close.dart';

changeUplaodImage(BuildContext context, final void Function()? uploadCamera,
    final void Function()? uploadGallery) {
  return showModalBottomSheet(
    backgroundColor: AppColors.white,
    isDismissible: true,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(24).w,
        child: SizedBox(
          height: 190.h,
          child: Column(
            children: [
              CustomIconClose(
                  margin: EdgeInsets.zero,
                  title: "Upload Photo",
                  onTap: () {
                    Navigator.pop(context);
                  },
                  image: "close"),
              SizedBox(height: 16.h),
              CustomButton(
                  color: AppColors.primaryBaseGreen,
                  text: "Camera",
                  onTap: uploadCamera),
              SizedBox(height: 16.h),
              CustomButton(
                  color: AppColors.primaryBaseGreen,
                  text: "Gallery",
                  onTap: uploadGallery),
            ],
          ),
        ),
      );
    },
  );
}
