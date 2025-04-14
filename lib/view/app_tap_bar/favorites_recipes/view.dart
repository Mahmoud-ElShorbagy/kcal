import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/route_utils/route_utils.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/view/app_tap_bar/custom_recipe_page/view.dart';
import 'package:kcal/view/no_result/view.dart';
import 'package:kcal/view/product_recipes/cubit/cubit.dart';
import 'package:kcal/widgets/build_final_resuilt.dart';
import 'package:kcal/widgets/circular_indicator.dart';

List<CategoryRecipeDTO> productRecipes = [];

class FavoritesRecipesView extends StatelessWidget {
  const FavoritesRecipesView({super.key, this.changeHeightSizedBox = false});
  final bool changeHeightSizedBox;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductRecipesCubit(),
      child: BlocBuilder<ProductRecipesCubit, ProductRecipesState>(
        builder: (context, state) {
          if (state is ProductRecipesLoading && productRecipes.isNotEmpty) {
            return const CircularIndicator();
          }
          if (productRecipes.isEmpty) {
            return const CustomNoResultPage(
              image: "recipes",
              text: "No Recipes Found",
              title: "You don’t save any recipes. Go ahead,",
              subTitle: " search and save your favorite recipe.",
            );
          } else {
            return Column(
              children: [
                ...List.generate(productRecipes.length, (index) {
                  final favoriteRecipes = productRecipes[index];
                  return CustomRecipesPageView(
                    onTap: () {
                      RouteUtils.navigateToCategoryRecipe(
                          favoriteRecipes, context);
                    },
                    imageFood: favoriteRecipes.image,
                    textTime: favoriteRecipes.textTime,
                    serve: favoriteRecipes.serve,
                    title: favoriteRecipes.title,
                    content: favoriteRecipes.content,
                  );
                }),
                if (productRecipes.length > 1) buildFinalReuilt(),
                SizedBox(height: changeHeightSizedBox ? 0 : 80.h),
              ],
            );
          }
        },
      ),
    );
  }
}
