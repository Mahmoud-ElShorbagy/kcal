import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/view/app_tap_bar/favorites_recipes/view.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'state.dart';

class ProductRecipesCubit extends Cubit<ProductRecipesState> {
  ProductRecipesCubit() : super(ProductInitial()) {
    _loadSavedRecipes();
  }

  static ProductRecipesCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  bool isProductSelected(CategoryRecipeDTO product) {
    return productRecipes.contains(product);
  }

  Future<void> _loadSavedRecipes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      if (!isClosed) emit(ProductRecipesLoading());
      await Future.delayed(const Duration(milliseconds: 500));
      if (isClosed) return;
      final recipesJson = prefs.getStringList('saved_recipes');
      if (recipesJson != null) {
        productRecipes = recipesJson
            .map((json) => CategoryRecipeDTO.fromJson(jsonDecode(json)))
            .toList();
        if (!isClosed) emit(const ProductRecipesLoaded());
      }
    } catch (e) {
      if (!isClosed) emit(const RecipesError('Failed to load saved recipes'));
    }
  }

  Future<void> _saveRecipes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final recipesJson =
        productRecipes.map((recipe) => jsonEncode(recipe.toJson())).toList();
    await prefs.setStringList('saved_recipes', recipesJson);
  }

  Future<void> addOrRemoveProductRecipes(
      CategoryRecipeDTO categoryRecipes) async {
    if (isClosed) return;

    if (!productRecipes.contains(categoryRecipes)) {
      productRecipes.add(categoryRecipes);
      if (!isClosed) emit(ProductAddedRecipe(categoryRecipes));
    } else {
      productRecipes.remove(categoryRecipes);
      if (!isClosed) emit(ProductRemovedRecipe(categoryRecipes));
    }
    await _saveRecipes();
  }

  void refrechData() async {
    await _loadSavedRecipes();
    emit(RecfrechPage());
  }
}
