import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/view/foods_page/cubit.dart';
import 'package:kcal/widgets/app/custom_product_details.dart';

import '../../../core/helpers/utils.dart';

class DetailsFishView extends StatelessWidget {
  const DetailsFishView({
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
            imageUrl: imagesFood[9],
            content: nameFoods[9],
          );
          return CustomProductDetails(
            imageProduct: Utils.getAssetPNGPath("fish"),
            imageGallery: Utils.getAssetjpgPath("fisho"),
            imageGalleryPath: Utils.getAssetjpgPath("fisht"),
            text: "Fish",
            title: "Alternative Names: Fish",
            content:
                "Place the salmon skin-side down on a piece of aluminum foil, then place it on a baking sheet. Mix the lemon juice, oil, garlic, salt, and pepper together in a small bowl. Pour the seasoning over the fillets. Wrap the fish in the foil, making sure to seal the edges well, leaving some room.",
            description:
                "Place the salmon skin-side down on a piece of aluminum foil, then place it on a baking sheet. Mix the lemon juice, oil, garlic, salt, and pepper together in a small bowl. Pour the seasoning over the fillets. Wrap the fish in the foil, making sure to seal the edges well, leaving some room.Place the salmon skin-side down on a piece of aluminum foil, then place it on a baking sheet. Mix the lemon juice, oil, garlic, salt, and pepper together in a small bowl. Pour the seasoning over the fillets. Wrap the fish in the foil, making sure to seal the edges well, leaving some room.",
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
