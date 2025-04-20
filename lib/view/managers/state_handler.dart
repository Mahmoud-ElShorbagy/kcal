import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/view/app_tap_bar/all_foods/view.dart';
import 'package:kcal/view/app_tap_bar/favorites_recipes/view.dart';
import 'package:kcal/view/app_tap_bar/trending_foods/view.dart';
import 'package:kcal/widgets/custom_button.dart';

import '../app_tap_bar/cubit.dart';
import '../app_tap_bar/custom_recipe_page/all_recipes.dart';
import '../app_tap_bar/favorites_foods/view.dart';

class StateHandler {
  static Widget buildChangeTapBar(
      final bool changeTapBar, final TextChangeState state) {
    return changeTapBar
        ? state.activeText == 0
            ? const CustomAllRecipesView()
            : state.activeText == 1
                ? const FavoritesRecipesView(
                    changeHeightSizedBox: true,
                  )
                : state.activeText == 2
                    ? const TrendingFoodsView()
                    : const SizedBox.shrink()
        : state.activeText == 0
            ? const AllFoodsView()
            : state.activeText == 1
                ? const FavoritesFoodsView(
                    changeHeightSizedBox: true,
                  )
                : state.activeText == 2
                    ? const TrendingFoodsView()
                    : const SizedBox.shrink();
  }

  static Widget buildSearchButtonWhenEmpty(final TextChangeState state,
      {final void Function()? onTap}) {
    return CustomButton(
      margin: const EdgeInsets.symmetric(horizontal: 25).w,
      text: "Search",
      onTap: onTap,
    );
  }

  static Widget buildChangeSizeMargin(
    final TextChangeState state,
  ) {
    return state.activeText == 0
        ? Container(
            margin: EdgeInsets.only(top: productFoods.isEmpty ? 90.h : 0.h),
            child: const FavoritesFoodsView())
        : Container(
            margin: EdgeInsets.only(top: productRecipes.isEmpty ? 90.h : 0),
            child: const FavoritesRecipesView());
  }
}
