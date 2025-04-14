import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/view/product_recipes/cubit/cubit.dart';

import '../../models/recipe_variables.dart';
import '../../widgets/app/custom_recipes_details.dart';

class RecipesSpicyVegView extends StatelessWidget {
  const RecipesSpicyVegView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductRecipesCubit(),
      child: BlocBuilder<ProductRecipesCubit, ProductRecipesState>(
        builder: (context, state) {
          final category = CategoryRecipeDTO(
              image: imageRecipe[2],
              textTime: textTime[2],
              serve: serve[2],
              title: titleRecipe[2],
              content: contentRecipe[2]);
          final cubit = ProductRecipesCubit.get(context);
          final isAdded =
              ProductRecipesCubit.get(context).isProductSelected(category);
          return CustomRecipesDetails(
            text: isAdded ? "Remove from favorite" : "Add to favorite",
            imagePath: imageRecipe[2],
            imageIcon: isAdded
                ? Utils.getAssetPNGPath("heart_active")
                : Utils.getAssetPNGPath("heart_outline"),
            textTime: textTime[2],
            serve: serve[2],
            title: titleRecipe[2],
            onTap: () {
              cubit.addOrRemoveProductRecipes(category);
            },
          );
        },
      ),
    );
  }
}
