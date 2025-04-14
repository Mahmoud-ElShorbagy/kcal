import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/helpers/utils.dart';
import 'custom_image.dart';

class CustomLogoImage extends StatelessWidget {
  const CustomLogoImage({
    super.key,
    this.margin,
  });
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: margin,
          child: CustomImageWidget(
              image: Utils.getAssetSVGPath("logo"),
              width: 58.29.w,
              height: 18.5.h)),
    );
  }
}
