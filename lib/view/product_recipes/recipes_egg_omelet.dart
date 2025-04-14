import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/view/product_recipes/cubit/cubit.dart';

import '../../core/helpers/utils.dart';
import '../../models/recipe_variables.dart';
import '../../widgets/app/custom_recipes_details.dart';

class RecipesEggOmeletView extends StatelessWidget {
  const RecipesEggOmeletView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductRecipesCubit(),
      child: BlocBuilder<ProductRecipesCubit, ProductRecipesState>(
        builder: (context, state) {
          final category = CategoryRecipeDTO(
              image: imageRecipe[4],
              textTime: textTime[4],
              serve: serve[4],
              title: titleRecipe[4],
              content: contentRecipe[4]);
          final cubit = ProductRecipesCubit.get(context);
          final isAdded =
              ProductRecipesCubit.get(context).isProductSelected(category);
          return CustomRecipesDetails(
            text: isAdded ? "Remove from favorite" : "Add to favorite",
            imagePath: imageRecipe[4],
            imageIcon: isAdded
                ? Utils.getAssetPNGPath("heart_active")
                : Utils.getAssetPNGPath("heart_outline"),
            textTime: textTime[4],
            serve: serve[4],
            title: titleRecipe[4],
            onTap: () {
              cubit.addOrRemoveProductRecipes(category);
            },
          );
        },
      ),
    );
  }
}
