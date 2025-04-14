import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/utils.dart';
import '../../../widgets/custom_image.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key, required this.curntIndex});
  final int curntIndex;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ...List.generate(
        3,
        (index) {
          return Row(
            children: [
              CustomImageWidget(
                  image: index == curntIndex
                      ? Utils.getAssetSVGPath("indicator")
                      : Utils.getAssetSVGPath("indicator_op"),
                  width: index == curntIndex ? 22.w : 7.w,
                  height: index == curntIndex ? 10.h : 7.h),
              if (index < 2) SizedBox(width: 4.w)
            ],
          );
        },
      ),
    ]);
  }
}
