import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/widgets/custom_text.dart';

import 'custom_image.dart';

class CustomIconClose extends StatelessWidget {
  const CustomIconClose({
    super.key,
    this.title,
    required this.image,
    this.onTap,
    this.margin = const EdgeInsets.only(top: 20, left: 20),
  });
  final String? title;
  final String image;
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SafeArea(
          child: CustomText(
              text: title,
              fontSize: 21.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "WorkSans"),
        ),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: Container(
            margin: margin,
            child: CustomImageWidget(
                image: Utils.getAssetPNGPath(image), width: 32.w, height: 32.h),
          ),
        )
      ],
    );
  }
}
