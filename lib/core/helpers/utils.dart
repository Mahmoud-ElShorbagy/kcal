// تحتوى على مسارات الصور والألوان وغيرها
import 'dart:io';

class Utils {
  static String getAssetSVGPath(String image) {
    return 'assets/images/svg/$image.svg';
  }

  static String getAssetPNGPath(String image) {
    return 'assets/images/png/$image.png';
  }

  static String getAssetjpgPath(String image) {
    return 'assets/images/png/$image.jpg';
  }

  static File? imagePath;
}
/*
   static Color getColor(String color) {
    final myColor = "0xff${color.replaceFirst("#", "")}";
    return Color(int.parse(myColor));
  }

  static String getAssetPNGPath(String image) {
    return 'assets/images/png/$image.png';
  }

  static String getAssetGIFPath(String image) {
    return 'assets/images/gif/$image.gif';
  }

  static String getAssetSVGPath(String image) {
    return 'assets/images/svg/$image.svg';
  }

  static String getAssetLottiePath(String image) {
    return 'assets/images/lottie/$image.json';
  }

  static String getAssetDummyPath(String image) {
    return 'assets/images/dummy/$image.png';
  }
  */
