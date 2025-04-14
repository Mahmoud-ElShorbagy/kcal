import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/helpers/app_colors.dart';
import 'custom_text.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return CustomText(
        text: text,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        fontFamily: "WorkSans",
        color: AppColors.secondary);
  }
}
