import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/core/helpers/utils.dart';

import '../../models/categorey_dto.dart';
import '../../models/recipe_variables.dart';
import '../../widgets/app/custom_recipes_details.dart';
import 'cubit/cubit.dart';

class RecipesFruityNuggetsView extends StatelessWidget {
  const RecipesFruityNuggetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductRecipesCubit(),
      child: BlocBuilder<ProductRecipesCubit, ProductRecipesState>(
        builder: (context, state) {
          final category = CategoryRecipeDTO(
              image: imageRecipe[3],
              textTime: textTime[3],
              serve: serve[3],
              title: titleRecipe[3],
              content: contentRecipe[3]);
          final cubit = ProductRecipesCubit.get(context);
          final isAdded =
              ProductRecipesCubit.get(context).isProductSelected(category);
          return CustomRecipesDetails(
            text: isAdded ? "Remove from favorite" : "Add to favorite",
            imagePath: imageRecipe[3],
            imageIcon: isAdded
                ? Utils.getAssetPNGPath("heart_active")
                : Utils.getAssetPNGPath("heart_outline"),
            textTime: textTime[3],
            serve: serve[3],
            title: titleRecipe[3],
            onTap: () {
              cubit.addOrRemoveProductRecipes(category);
            },
          );
        },
      ),
    );
  }
}
