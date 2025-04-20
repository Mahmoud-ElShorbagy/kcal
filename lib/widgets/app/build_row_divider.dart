import 'package:flutter/material.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/widgets/custom_text.dart';

class BuildRowDivider extends StatelessWidget {
  const BuildRowDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: Divider(
          color: AppColors.dividerColor,
        )),
        CustomText(
            text: "   OR   ",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: "WorkSans",
            color: AppColors.dividerColor),
        Expanded(
            child: Divider(
          color: AppColors.dividerColor,
        )),
      ],
    );
  }
}
