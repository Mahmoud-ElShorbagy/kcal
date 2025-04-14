import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/filter_helper.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/models/recipe_variables.dart';
import 'package:kcal/view/no_result/view.dart';
import 'package:kcal/view/search/cubit.dart';
import 'package:kcal/view/search/units/loading_search.dart';
import 'package:kcal/view/search/units/result_search_food.dart';
import 'package:kcal/view/search/units/result_search_recipes.dart';
import 'package:kcal/view/search/units/search_field.dart';
import 'package:kcal/view/show_all/view.dart';

import 'units/home_search.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<SearchCubit>(context);
          final filteredRecipes = FilterHelper.filteredRecipesList;
          final filteredFoods = FilterHelper.filteredFoodsList;
          final allRecipes = cubit.myController.text.contains("rec")
              ? categoryRecipe
              : filteredRecipes;
          final allFoods = cubit.myController.text.contains("foo")
              ? categoryFoods
              : filteredFoods;
          return Column(
            children: [
              SizedBox(height: 25.h),
              SearchField(cubit: cubit),
              Expanded(
                child: state is SearchLoading
                    ? loadingSearch()
                    : cubit.myController.text.isNotEmpty
                        ? ListView(
                            children: [
                              if (filteredRecipes.isNotEmpty ||
                                  cubit.myController.text.contains("rec"))
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 20)
                                          .w,
                                  child: ShowAllView(
                                    title: "Recipes",
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RouteNames.recipesPage);
                                    },
                                  ),
                                ),
                              ResultSearchRecipesView(
                                  cubit: cubit,
                                  filteredRecipes: filteredRecipes,
                                  allRecipes: allRecipes),
                              if (filteredRecipes.isEmpty &&
                                  filteredFoods.isEmpty &&
                                  !cubit.myController.text.contains("foo") &&
                                  !cubit.myController.text.contains("rec"))
                                Container(
                                  margin: EdgeInsets.only(top: 100.h),
                                  child: const CustomNoResultPage(
                                      image: "results",
                                      text: "No Results Found",
                                      title:
                                          "Try searching for a different keywork",
                                      subTitle:
                                          " or tweek your search a little."),
                                ),
                              if (filteredFoods.isNotEmpty ||
                                  cubit.myController.text.contains("foo"))
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 20)
                                          .w,
                                  child: ShowAllView(
                                    title: "Foods",
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RouteNames.foodsPage);
                                    },
                                  ),
                                ),
                              ResultSearchFoodsView(
                                  cubit: cubit,
                                  filteredFoods: filteredFoods,
                                  allFoods: allFoods)
                            ],
                          )
                        : const HomeSearchView(),
              ),
            ],
          );
        },
      ),
    );
  }
}
