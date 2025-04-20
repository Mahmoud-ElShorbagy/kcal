import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/widgets/custom_image.dart';

class ImageUserView extends StatelessWidget {
  const ImageUserView({
    super.key,
    this.imagePath,
  });
  final File? imagePath;
  @override
  Widget build(BuildContext context) {
    if (imagePath == null) {
      return CustomImageWidget(
          image: Utils.getAssetSVGPath("profile"), width: 211.w, height: 175.h);
    } else {
      return Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 80.r,
            backgroundImage: FileImage((imagePath!)),
          ),
        ],
      );
    }
  }
}
