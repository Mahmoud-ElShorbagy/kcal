import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/view/app_tap_bar/favorites_foods/view.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'state.dart';

class ProductFoodCubit extends Cubit<ProductFoodState> {
  ProductFoodCubit() : super(ProductFoodInitial()) {
    loadSavedFoods();
  }
  static ProductFoodCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> saveFoods() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final foodsJson = productFoods
        .map(
          (e) => jsonEncode(e.toJson()),
        )
        .toList();
    await prefs.setStringList("saved_foods", foodsJson);
  }

  Future<void> loadSavedFoods() async {
    try {
      if (!isClosed) emit(ProductFoodLoading());
      await Future.delayed(const Duration(milliseconds: 500));
      if (isClosed) return;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final foodsJson = prefs.getStringList("saved_foods");
      if (foodsJson != null) {
        productFoods = foodsJson.map((e) {
          return CategoryDTO.fromJson(jsonDecode(e));
        }).toList();

        if (!isClosed) emit(ProductFoodLoaded());
      }
    } catch (e) {
      if (!isClosed) emit(ProductFoodError(e.toString()));
    }
  }

  bool isProductSelected(CategoryDTO product) {
    return productFoods.contains(product);
  }

  void addOrRemoveProductFood(CategoryDTO categoryFoods) async {
    if (!productFoods.contains(categoryFoods)) {
      productFoods.add(categoryFoods);
      emit(ProductAddedFood(categoryFoods));
    } else {
      productFoods.remove(categoryFoods);
      emit(ProductRemovedFood(categoryFoods));
    }
    await saveFoods();
  }
}
