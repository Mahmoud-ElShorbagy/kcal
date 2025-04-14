import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/view/foods_page/cubit/cubit.dart';
import 'package:kcal/widgets/app/custom_product_details.dart';

import '../../core/helpers/utils.dart';

class DetailsRiceView extends StatelessWidget {
  const DetailsRiceView({
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
            imageUrl: imagesFood[11],
            content: nameFoods[11],
          );
          return CustomProductDetails(
            imageProduct: Utils.getAssetPNGPath("rice"),
            imageGallery: Utils.getAssetjpgPath("riceo"),
            imageGalleryPath: Utils.getAssetjpgPath("ricet"),
            text: "Rice",
            title: "Alternative Names: Rice",
            content:
                "To begin, rinse the rice with cold water until the water runs clear, then drain it in a colander. Bring the water to a boil, then cover and simmer for 10 minutes without stirring. Turn off the heat and let it sit for 15 minutes. Finally, fluff the rice with a rice scoop or fork, then serve and enjoy!",
            description:
                "To begin, rinse the rice with cold water until the water runs clear, then drain it in a colander. Bring the water to a boil, then cover and simmer for 10 minutes without stirring. Turn off the heat and let it sit for 15 minutes. Finally, fluff the rice with a rice scoop or fork, then serve and enjoy!To begin, rinse the rice with cold water until the water runs clear, then drain it in a colander. Bring the water to a boil, then cover and simmer for 10 minutes without stirring. Turn off the heat and let it sit for 15 minutes. Finally, fluff the rice with a rice scoop or fork, then serve and enjoy!",
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
