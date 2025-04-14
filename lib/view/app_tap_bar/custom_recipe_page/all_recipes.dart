import 'package:flutter/material.dart';
import 'package:kcal/core/route_utils/route_utils.dart';

import '../../../models/recipe_variables.dart';
import 'view.dart';

class CustomAllRecipesView extends StatelessWidget {
  final bool changeIndex;
  const CustomAllRecipesView({super.key, this.changeIndex = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(changeIndex ? categoryRecipe.length : 2, (index) {
          final categories = categoryRecipe[index];
          return CustomRecipesPageView(
              onTap: () {
                RouteUtils.navigateToCategoryRecipe(categories, context);
              },
              imageFood: imageRecipe[index],
              textTime: textTime[index],
              serve: serve[index],
              title: titleRecipe[index],
              content: contentRecipe[index]);
        })
      ],
    );
  }
}
