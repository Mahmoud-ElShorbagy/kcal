import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/widgets/custom_text.dart';

import '../../core/helpers/app_colors.dart';

class ShowAllView extends StatelessWidget {
  const ShowAllView({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          letterSpacing: 0.8.sp,
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "WorkSans",
          text: title,
          color: AppColors.title,
        ),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: CustomText(
            letterSpacing: 0.8.sp,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "WorkSans",
            textSpan: "View All",
            color: AppColors.title,
          ),
        ),
      ],
    );
  }
}
