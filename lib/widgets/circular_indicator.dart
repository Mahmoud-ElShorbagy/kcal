import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    super.key,
    this.height = 50,
    this.mainAxisSize = MainAxisSize.max,
  });
  final double height;
  final MainAxisSize mainAxisSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize,
      children: [
        SizedBox(
          height: height.h,
        ),
        const CircularProgressIndicator(
          color: AppColors.primary,
        ),
        SizedBox(
          height: height.h,
        )
      ],
    );
  }
}
