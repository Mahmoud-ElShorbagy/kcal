import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/models/categorey_dto.dart';

import 'package:kcal/models/recipe_variables.dart';
import 'package:kcal/view/product_recipes/cubit/cubit.dart';

import '../../widgets/app/custom_recipes_details.dart';

class RecipesBurgerView extends StatelessWidget {
  const RecipesBurgerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductRecipesCubit(),
      child: BlocBuilder<ProductRecipesCubit, ProductRecipesState>(
        builder: (context, state) {
          final category = CategoryRecipeDTO(
              image: imageRecipe[0],
              textTime: textTime[0],
              serve: serve[0],
              title: titleRecipe[0],
              content: contentRecipe[0]);
          final cubit = ProductRecipesCubit.get(context);
          final isAdded =
              ProductRecipesCubit.get(context).isProductSelected(category);
          return CustomRecipesDetails(
            text: isAdded ? "Remove from favorite" : "Add to favorite",
            imagePath: imageRecipe[0],
            imageIcon: isAdded
                ? Utils.getAssetPNGPath("heart_active")
                : Utils.getAssetPNGPath("heart_outline"),
            textTime: textTime[0],
            serve: serve[0],
            title: """Chicken Burger With
Nuggets""",
            onTap: () {
              cubit.addOrRemoveProductRecipes(category);
            },
          );
        },
      ),
    );
  }
}
