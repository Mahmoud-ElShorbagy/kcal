import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget(
      {super.key,
      required this.image,
      required this.width,
      required this.height,
      this.fit});
  final String image;
  final double width;
  final double height;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    if (image.endsWith(".svg")) {
      return SvgPicture.asset(image, width: width, height: height);
    } else if (image.endsWith(".png") || image.endsWith(".jpg")) {
      return Image.asset(fit: fit, image, width: width, height: height);
    } else if (image.startsWith("https://")) {
      return Image.network(image, width: width, height: height);
    } else {
      throw UnsupportedError("Unsupported image type");
    }
  }
}
