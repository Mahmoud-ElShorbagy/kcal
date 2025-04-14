import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/models/recipe_variables.dart';

import '../../core/helpers/utils.dart';
import '../../models/categorey_dto.dart';
import '../../widgets/app/custom_recipes_details.dart';
import 'cubit/cubit.dart';

class RecipesCrispyView extends StatelessWidget {
  const RecipesCrispyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductRecipesCubit(),
      child: BlocBuilder<ProductRecipesCubit, ProductRecipesState>(
        builder: (context, state) {
          final category = CategoryRecipeDTO(
              image: imageRecipe[1],
              textTime: textTime[1],
              serve: serve[1],
              title: titleRecipe[1],
              content: contentRecipe[1]);

          final cubit = ProductRecipesCubit.get(context);
          final isAdded =
              ProductRecipesCubit.get(context).isProductSelected(category);
          return CustomRecipesDetails(
            text: isAdded ? "Remove from favorite" : "Add to favorite",
            imagePath: imageRecipe[1],
            imageIcon: isAdded
                ? Utils.getAssetPNGPath("heart_active")
                : Utils.getAssetPNGPath("heart_outline"),
            textTime: textTime[1],
            serve: serve[1],
            title: "Crispy Indian Breads",
            onTap: () {
              cubit.addOrRemoveProductRecipes(category);
            },
          );
        },
      ),
    );
  }
}
