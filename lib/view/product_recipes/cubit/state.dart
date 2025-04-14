part of 'cubit.dart';

sealed class ProductRecipesState extends Equatable {
  const ProductRecipesState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductRecipesState {}

class ProductAddedRecipe extends ProductRecipesState {
  final CategoryRecipeDTO categoryRecipe;
  const ProductAddedRecipe(this.categoryRecipe);
  @override
  List<Object> get props => [categoryRecipe];
}

class ProductRemovedRecipe extends ProductRecipesState {
  final CategoryRecipeDTO categoryRecipe;
  const ProductRemovedRecipe(this.categoryRecipe);
  @override
  List<Object> get props => [categoryRecipe];
}

class ProductRecipesLoading extends ProductRecipesState {}

class ProductRecipesLoaded extends ProductRecipesState {
  const ProductRecipesLoaded();
  @override
  List<Object> get props => [];
}

class RecipesError extends ProductRecipesState {
  final String message;
  const RecipesError(this.message);
  @override
  List<Object> get props => [message];
}

class RecfrechPage extends ProductRecipesState {}
