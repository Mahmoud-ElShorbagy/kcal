import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/widgets/custom_text.dart';

appSnackBar(final BuildContext context, final String text, final Color color,
    {int seconds = 3}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.white,
        onPressed: () {},
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16).r),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      duration: Duration(seconds: seconds),
      content: CustomText(
          color: Colors.white,
          letterSpacing: 0.2.sp,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "WorkSans",
          text: text),
    ),
  );
}
