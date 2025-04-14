import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/helpers/app_colors.dart';
import 'custom_text.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.text,
    this.value,
    this.onChanged,
  });
  final String text;
  final bool? value;
  final void Function(bool? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          letterSpacing: 0.1.sp,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "WorkSans",
          text: text,
          color: AppColors.secondaryText,
        ),
        const Spacer(),
        Checkbox(
            activeColor: AppColors.primaryBaseGreen,
            checkColor: AppColors.white,
            value: value,
            onChanged: onChanged)
      ],
    );
  }
}
