import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/widgets/custom_text.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../widgets/custom_image.dart';

Widget buildRowTitleWithIcon(final String title, final String imageIcon) {
  return Row(
    children: [
      CustomText(
        letterSpacing: 0.4.sp,
        color: AppColors.title,
        fontSize: 19.5.sp,
        fontWeight: FontWeight.w500,
        fontFamily: "WorkSans",
        text: title,
      ),
      const Spacer(),
      InkWell(
        child: CustomImageWidget(image: imageIcon, width: 48, height: 48),
      ),
    ],
  );
}
