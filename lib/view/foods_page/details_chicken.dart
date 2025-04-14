import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/view/foods_page/cubit/cubit.dart';
import 'package:kcal/widgets/app/custom_product_details.dart';

import '../../core/helpers/utils.dart';

class DetailschickenView extends StatelessWidget {
  const DetailschickenView({
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
            imageUrl: imagesFood[7],
            content: nameFoods[7],
          );
          return CustomProductDetails(
            imageProduct: Utils.getAssetPNGPath("chicken_hip"),
            imageGallery: Utils.getAssetjpgPath("chickeno"),
            imageGalleryPath: Utils.getAssetjpgPath("chickent"),
            text: "Chicken Hip",
            title: "Alternative Names: Chicken",
            content:
                "Place the chicken over medium heat with oil and let it heat up. Then, add the onion, garlic, spices, and parsley and stir. Add the marinated chicken and a cup or more of water until it covers the chicken. Cover the pot, reduce the heat slightly, and let it simmer for 40 minutes, or until the chicken is fully cooked.",
            description:
                "Place the chicken over medium heat with oil and let it heat up. Then, add the onion, garlic, spices, and parsley and stir. Add the marinated chicken and a cup or more of water until it covers the chicken. Cover the pot, reduce the heat slightly, and let it simmer for 40 minutes, or until the chicken is fully cooked.",
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
