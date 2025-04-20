import 'package:flutter/material.dart';
import 'package:kcal/core/helpers/app_colors.dart';

class TrendingRecipeTapView extends StatelessWidget {
  const TrendingRecipeTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 150,
      decoration: const BoxDecoration(color: AppColors.accentYellowLight100),
    );
  }
}
