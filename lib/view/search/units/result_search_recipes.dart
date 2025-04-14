import 'package:flutter/material.dart';

import '../../../core/route_utils/route_utils.dart';
import '../../../models/categorey_dto.dart';
import '../../app_tap_bar/custom_recipe_page/view.dart';
import '../cubit.dart';

class ResultSearchRecipesView extends StatelessWidget {
  const ResultSearchRecipesView(
      {super.key,
      required this.cubit,
      required this.filteredRecipes,
      required this.allRecipes});
  final SearchCubit cubit;
  final List<CategoryRecipeDTO> filteredRecipes;
  final List<CategoryRecipeDTO> allRecipes;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...List.generate(
          cubit.myController.text.contains("rec") ? 2 : filteredRecipes.length,
          (index) {
        return CustomRecipesPageView(
            onTap: () {
              RouteUtils.navigateToCategoryRecipe(allRecipes[index], context);
            },
            imageFood: allRecipes[index].image,
            textTime: allRecipes[index].textTime,
            serve: allRecipes[index].serve,
            title: allRecipes[index].title,
            content: allRecipes[index].content);
      }),
    ]);
  }
}
