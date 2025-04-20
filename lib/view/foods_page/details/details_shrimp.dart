import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/view/foods_page/cubit.dart';
import 'package:kcal/widgets/app/custom_product_details.dart';

import '../../../core/helpers/utils.dart';

class DetailsShrimpView extends StatelessWidget {
  const DetailsShrimpView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductFoodCubit(),
      child: BlocBuilder<ProductFoodCubit, ProductFoodState>(
        builder: (context, state) {
          final cubit = ProductFoodCubit.get(context);
          final category = CategoryDTO(
            imageUrl: imagesFood[15],
            content: nameFoods[15],
          );
          return CustomProductDetails(
            imageProduct: Utils.getAssetPNGPath("shrimp"),
            imageGallery: Utils.getAssetjpgPath("shrimpo"),
            imageGalleryPath: Utils.getAssetjpgPath("shrimpt"),
            text: "Shrimp",
            title: "Alternative Names: Shrimp",
            content:
                "Our dangerous mixture consists of: 1 tablespoon of cumin 1 tablespoon of turmeric 1 teaspoon of garlic powder 1 teaspoon of onion powder 1 teaspoon of paprika 1 teaspoon of chili pepper Salt and pepper We also need: 1 kilo of shrimp 5 tablespoons of the dangerous mixture Lemon juice 3 cups of flour Salt Another cup and a half of sparkling water We will do the following: We clean the shrimp and do not throw away the shells because we will need them too.",
            description:
                "Our dangerous mixture consists of: 1 tablespoon of cumin 1 tablespoon of turmeric 1 teaspoon of garlic powder 1 teaspoon of onion powder 1 teaspoon of paprika 1 teaspoon of chili pepper Salt and pepper We also need: 1 kilo of shrimp 5 tablespoons of the dangerous mixture Lemon juice 3 cups of flour Salt Another cup and a half of sparkling water We will do the following: We clean the shrimp and do not throw away the shells because we will need them too.Our dangerous mixture consists of: 1 tablespoon of cumin 1 tablespoon of turmeric 1 teaspoon of garlic powder 1 teaspoon of onion powder 1 teaspoon of paprika 1 teaspoon of chili pepper Salt and pepper We also need: 1 kilo of shrimp 5 tablespoons of the dangerous mixture Lemon juice 3 cups of flour Salt Another cup and a half of sparkling water We will do the following: We clean the shrimp and do not throw away the shells because we will need them too.",
            onTap: () {
              cubit.addOrRemoveProductFood(category);
            },
            titleButton: cubit.isProductSelected(category)
                ? "Remove from favorite"
                : "Add to favorite",
          );
        },
      ),
    );
  }
}
