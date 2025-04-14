part of 'cubit.dart';

sealed class ProductFoodState extends Equatable {
  const ProductFoodState();

  @override
  List<Object> get props => [];
}

final class ProductFoodInitial extends ProductFoodState {}

final class ProductAddedFood extends ProductFoodState {
  final CategoryDTO productFoods;
  const ProductAddedFood(this.productFoods);
  @override
  List<Object> get props => [productFoods];
}

final class ProductRemovedFood extends ProductFoodState {
  final CategoryDTO productFoods;
  const ProductRemovedFood(this.productFoods);
  @override
  List<Object> get props => [productFoods];
}

final class ProductFoodLoaded extends ProductFoodState {
  @override
  List<Object> get props => [];
}

final class ProductFoodLoading extends ProductFoodState {}

final class ProductFoodError extends ProductFoodState {
  final String message;
  const ProductFoodError(this.message);
  @override
  List<Object> get props => [message];
}
