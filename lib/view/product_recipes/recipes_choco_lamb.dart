import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/view/product_recipes/cubit/cubit.dart';
import 'package:kcal/widgets/app/custom_recipes_details.dart';

import '../../core/helpers/utils.dart';
import '../../models/recipe_variables.dart';

class RecipesChocoLambView extends StatelessWidget {
  const RecipesChocoLambView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductRecipesCubit(),
      child: BlocBuilder<ProductRecipesCubit, ProductRecipesState>(
        builder: (context, state) {
          final category = CategoryRecipeDTO(
              image: imageRecipe[7],
              textTime: textTime[7],
              serve: serve[7],
              title: titleRecipe[7],
              content: contentRecipe[7]);
          final cubit = ProductRecipesCubit.get(context);
          final isAdded =
              ProductRecipesCubit.get(context).isProductSelected(category);
          return CustomRecipesDetails(
            text: isAdded ? "Remove from favorite" : "Add to favorite",
            imagePath: imageRecipe[7],
            imageIcon: isAdded
                ? Utils.getAssetPNGPath("heart_active")
                : Utils.getAssetPNGPath("heart_outline"),
            textTime: textTime[7],
            serve: serve[7],
            title: titleRecipe[7],
            onTap: () {
              cubit.addOrRemoveProductRecipes(category);
            },
          );
        },
      ),
    );
  }
}
