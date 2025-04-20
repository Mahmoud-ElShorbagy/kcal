import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/widgets/custom_text.dart';

class NavigateToPage extends StatelessWidget {
  const NavigateToPage({super.key});

  static Container navigateToPage(BuildContext context,
      final void Function()? onTap, final String? text, final String? texSpan) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 16.h),
      child: InkWell(
        onTap: onTap,
        child: CustomText(
          text: text,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "WorkSans",
          color: AppColors.secondary,
          textSpan: texSpan,
        ),
      ),
    );
  }

  static Container navigate(
    BuildContext context,
    final void Function()? onTap,
    final EdgeInsetsGeometry? margin,
    final String? text,
    final AlignmentGeometry? alignment,
  ) {
    return Container(
      alignment: alignment,
      margin: margin,
      child: InkWell(
        onTap: onTap,
        child: CustomText(
            text: text,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "WorkSans",
            color: AppColors.darkGreen600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
