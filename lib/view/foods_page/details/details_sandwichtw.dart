import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/view/foods_page/cubit.dart';
import 'package:kcal/widgets/app/custom_product_details.dart';

import '../../../core/helpers/utils.dart';

class DetailsSandwichTwView extends StatelessWidget {
  const DetailsSandwichTwView({
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
            imageUrl: imagesFood[13],
            content: nameFoods[13],
          );
          return CustomProductDetails(
            imageProduct: Utils.getAssetPNGPath("sandwich"),
            imageGallery: Utils.getAssetjpgPath("sandwicho"),
            imageGalleryPath: Utils.getAssetjpgPath("sandwicht"),
            text: "Sandwich",
            title: "Alternative Names: Sandwich",
            content:
                "Spread a little butter evenly on the bread, then add the sauce. Add a few slices of potato, then sprinkle with a little cumin and chat masala. Add 2 to 3 slices of cucumber, tomato, onion, and beetroot, then sprinkle with a little cumin, chat masala, and salt. Cover the sandwiches with the remaining bread slices, then brush the bread with a little butter to toast it.",
            description:
                "Spread a little butter evenly on the bread, then add the sauce. Add a few slices of potato, then sprinkle with a little cumin and chat masala. Add 2 to 3 slices of cucumber, tomato, onion, and beetroot, then sprinkle with a little cumin, chat masala, and salt. Cover the sandwiches with the remaining bread slices, then brush the bread with a little butter to toast it.Spread a little butter evenly on the bread, then add the sauce. Add a few slices of potato, then sprinkle with a little cumin and chat masala. Add 2 to 3 slices of cucumber, tomato, onion, and beetroot, then sprinkle with a little cumin, chat masala, and salt. Cover the sandwiches with the remaining bread slices, then brush the bread with a little butter to toast it.",
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
