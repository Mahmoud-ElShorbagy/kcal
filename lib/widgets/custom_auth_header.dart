import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/custom_logo.dart';
import 'package:kcal/widgets/custom_text_body.dart';

import '../core/helpers/app_colors.dart';
import 'custom_text.dart';

class CustomAuthHeader extends StatelessWidget {
  const CustomAuthHeader({
    super.key,
    required this.text,
    required this.title,
    required this.subTitle,
    this.pageNumber,
    this.rmovetext = false,
  });
  final String text;
  final String title;
  final String subTitle;
  final String? pageNumber;
  final bool rmovetext;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
            child: Container(
                margin: EdgeInsets.only(top: 65.h, bottom: 30.h, right: 253.w),
                child: const CustomLogoImage())),
        Row(
          children: [
            CustomTextBody(
              changeFontSize: true,
              changeAxisSize: true,
              fontSizeSmall: 12.5.sp,
              fontSizedBig: 19.5.sp,
              color: AppColors.secondaryText,
              text: text,
              title: title,
              subTitle: subTitle,
            ),
            const Spacer(),
            rmovetext
                ? CustomImageWidget(
                    image: Utils.getAssetPNGPath("done"), width: 24, height: 24)
                : CustomText(
                    letterSpacing: 0.356.sp,
                    text: pageNumber,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "WorkSans",
                    color: AppColors.title)
          ],
        ),
      ],
    );
  }
}
