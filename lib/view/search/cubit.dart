import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/core/helpers/filter_helper.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/models/recipe_variables.dart';

part 'state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial()) {
    initSearch();
  }
  static BlocProvider<SearchCubit> get(BuildContext context) =>
      BlocProvider.of(context);
  final TextEditingController myController = TextEditingController();

  void initSearch() {
    FilterHelper.filteredRecipesList = categoryRecipe;
    FilterHelper.filteredFoodsList = categoryFoods;
    emit(SearchLoaded());
  }

  void filterSearch(String v) async {
    emit(SearchLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    FilterHelper.filterRecipes(v);
    FilterHelper.filterFoods(v);
    emit(SearchLoaded());
  }

  @override
  Future<void> close() {
    myController.dispose();
    return super.close();
  }
}
