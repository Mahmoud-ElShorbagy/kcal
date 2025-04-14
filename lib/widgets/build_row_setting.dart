import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/custom_text.dart';

class CustomBuildRowSetting extends StatelessWidget {
  const CustomBuildRowSetting(
      {super.key,
      this.onTap,
      required this.imageIcon,
      required this.text,
      required this.image,
      this.width = 24,
      this.height = 24,
      this.color = AppColors.secondaryText});
  final Color? color;
  final double width;
  final double height;
  final String text;
  final String imageIcon;
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Row(children: [
              Container(
                alignment: Alignment.center,
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.accentYellowLight100,
                  borderRadius: BorderRadius.circular(8).r,
                ),
                child: CustomImageWidget(
                    image: Utils.getAssetPNGPath(imageIcon),
                    width: 28.w,
                    height: 28.h),
              ),
              SizedBox(
                width: 16.w,
              ),
              CustomText(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                fontFamily: "WorkSans",
                text: text,
                color: color,
              ),
              const Spacer(),
              CustomImageWidget(
                  image: Utils.getAssetPNGPath(image),
                  width: width.w,
                  height: height.h)
            ]),
          ),
        ],
      ),
    );
  }
}
