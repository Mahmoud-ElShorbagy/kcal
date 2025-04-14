import 'package:flutter/widgets.dart';

import '../core/helpers/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.fontFamily,
      this.color,
      this.textSpan,
      this.letterSpacing,
      this.wordSpacing,
      this.height,
      this.colorTextSpan = AppColors.textOnTap});
  final String? text;
  final double fontSize;
  final FontWeight fontWeight;
  final String? fontFamily;
  final Color? color;
  final String? textSpan;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final Color? colorTextSpan;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: text,
          style: TextStyle(
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              color: color,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing),
          children: [
            TextSpan(
                text: textSpan,
                style: TextStyle(
                  color: colorTextSpan,
                  fontFamily: "WorkSans",
                  fontSize: fontSize,
                ))
          ]),
    );
  }
}
