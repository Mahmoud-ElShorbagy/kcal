import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/widgets/custom_image.dart';

import '../core/helpers/utils.dart';

class CustomWidgetIcon extends StatelessWidget {
  const CustomWidgetIcon(
      {super.key, required this.image, this.width = 32, this.height = 32});
  final String image;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return CustomImageWidget(
      image: Utils.getAssetPNGPath(image),
      width: width.w,
      height: height.h,
    );
  }
}
