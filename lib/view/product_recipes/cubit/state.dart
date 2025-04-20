part of 'cubit.dart';

sealed class ProductRecipesState {
  const ProductRecipesState();
}

final class ProductInitial extends ProductRecipesState {}

class ProductAddedRecipe extends ProductRecipesState {
  final CategoryRecipeDTO categoryRecipe;
  const ProductAddedRecipe(this.categoryRecipe);
}

class ProductRemovedRecipe extends ProductRecipesState {
  final CategoryRecipeDTO categoryRecipe;
  const ProductRemovedRecipe(this.categoryRecipe);
}

class ProductRecipesLoading extends ProductRecipesState {}

class ProductRecipesLoaded extends ProductRecipesState {
  const ProductRecipesLoaded();
}

class RecipesError extends ProductRecipesState {
  final String message;
  const RecipesError(this.message);
}

class RecfrechPage extends ProductRecipesState {}
