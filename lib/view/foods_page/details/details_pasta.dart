import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/view/foods_page/cubit.dart';
import 'package:kcal/widgets/app/custom_product_details.dart';

import '../../../core/helpers/utils.dart';

class DetailsPastaView extends StatelessWidget {
  const DetailsPastaView({
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
            imageUrl: imagesFood[10],
            content: nameFoods[10],
          );
          return CustomProductDetails(
            imageProduct: Utils.getAssetPNGPath("pasta"),
            imageGallery: Utils.getAssetjpgPath("pao"),
            imageGalleryPath: Utils.getAssetjpgPath("pat"),
            text: "Pasta",
            title: "Alternative Names: Pasta",
            content:
                "Add the tomato paste, then add the diced tomatoes. Season with Italian seasoning, red pepper, salt, and pepper and simmer for 10 minutes. Add the pasta to the pan along with ½ cup of the pasta water and stir until the ingredients and sauce are combined. Garnish the pasta dish with basil and Parmesan cheese.",
            description:
                "Add the tomato paste, then add the diced tomatoes. Season with Italian seasoning, red pepper, salt, and pepper and simmer for 10 minutes. Add the pasta to the pan along with ½ cup of the pasta water and stir until the ingredients and sauce are combined. Garnish the pasta dish with basil and Parmesan cheese.Add the tomato paste, then add the diced tomatoes. Season with Italian seasoning, red pepper, salt, and pepper and simmer for 10 minutes. Add the pasta to the pan along with ½ cup of the pasta water and stir until the ingredients and sauce are combined. Garnish the pasta dish with basil and Parmesan cheese.",
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
