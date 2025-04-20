import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/view/foods_page/cubit.dart';
import 'package:kcal/widgets/app/custom_product_details.dart';

class DetailsPizzaView extends StatelessWidget {
  const DetailsPizzaView({
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
            imageUrl: imagesFood[3],
            content: nameFoods[3],
          );
          return CustomProductDetails(
            imageProduct: Utils.getAssetSVGPath("pizza"),
            imageGallery: Utils.getAssetjpgPath("pizzao"),
            imageGalleryPath: Utils.getAssetjpgPath("pizzat"),
            text: "Pizza",
            title: "Alternative Names: Pizza",
            content:
                "Pizza is basically made up of dough, cheese, and tomato sauce, but it can also include other ingredients depending on the type of pizza you're making. Examples include fish, basil, meat, shrimp, chicken, mushrooms, corn, olives, and peppers.",
            description:
                "Bring a large bowl.Add the olives, carrots, leeks, flour, mustard, sauce, salt, and hot pepper.Mix the ingredients together well, then pour the mixture over the dough, spreading it evenly.Bake in the oven for 15 minutes over medium heat.Sprinkle the cheese pieces over the dough while it's hot.",
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
