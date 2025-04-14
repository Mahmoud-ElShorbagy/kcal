import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helpers/app_colors.dart';
import '../../widgets/custom_check_box.dart';

class AppCheckBoxView extends StatefulWidget {
  const AppCheckBoxView({
    super.key,
  });

  @override
  State<AppCheckBoxView> createState() => _AppCheckBoxViewState();
}

class _AppCheckBoxViewState extends State<AppCheckBoxView> {
  bool indian = false;
  bool chinese = false;
  bool italian = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCheckBox(
          text: "Indian",
          value: indian,
          onChanged: (value) {
            setState(() {
              indian = value!;
            });
          },
        ),
        Divider(
          thickness: 1.5.sp,
          color: AppColors.accentGrayLight50,
        ),
        CustomCheckBox(
          text: "Chinese",
          value: chinese,
          onChanged: (value) {
            setState(() {
              chinese = value!;
            });
          },
        ),
        Divider(
          thickness: 1.5.sp,
          color: AppColors.accentGrayLight50,
        ),
        CustomCheckBox(
          text: "Italian",
          value: italian,
          onChanged: (value) {
            setState(() {
              italian = value!;
            });
          },
        ),
      ],
    );
  }
}
