import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/models/recipe_variables.dart';

class FilterHelper {
  static List<CategoryDTO> filteredFoodsList = [];
  static List<CategoryRecipeDTO> filteredRecipesList = [];
  static void filterFoods(String v) {
    filteredFoodsList = categoryFoods.where((product) {
      final nameLower = product.content.toLowerCase();
      final queryLower = v.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }

  static void filterRecipes(String v) {
    filteredRecipesList = categoryRecipe.where((product) {
      final nameLower = product.title.toLowerCase();
      final timeLower = product.textTime.toLowerCase();
      final queryLower = v.toLowerCase();
      return nameLower.contains(queryLower) || timeLower.contains(queryLower);
    }).toList();
  }
}
