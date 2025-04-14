import 'package:flutter/material.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/view/app_tap_bar/trending_recipe_tap/view.dart';
import 'package:kcal/view/app_tap_bar/favorites_recipes/view.dart';

class TrendingRecipeTapView extends StatelessWidget {
  const TrendingRecipeTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 150,
      decoration: BoxDecoration(color: AppColors.accentYellowLight100),
    );
  }
}
