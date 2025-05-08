import 'package:flutter/services.dart';
import 'package:kcal/core/helpers/app_colors.dart';

void statusBarColor([Color? color]) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: color ?? AppColors.primary,
    statusBarBrightness: Brightness.light,
  ));
}
