import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/view/foods_page/cubit.dart';
import 'package:kcal/widgets/app/custom_product_details.dart';

class DetailsBurgerView extends StatelessWidget {
  const DetailsBurgerView({
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
            imageUrl: imagesFood[1],
            content: nameFoods[1],
          );
          return CustomProductDetails(
            imageProduct: Utils.getAssetSVGPath("burger"),
            imageGallery: Utils.getAssetjpgPath("burgero"),
            imageGalleryPath: Utils.getAssetjpgPath("burgert"),
            text: "Burger",
            title: "Alternative Names: Burger",
            content:
                "Double Beef Burger Two 95g patties of fresh, unleavened beef, seasoned with dark salt, cooked on a grilled surface, topped with cheddar cheese, assembled in a soft, toasted bun with our special burger, with lettuce, tomatoes and onions.",
            description:
                "The origins of the burger are among the origins of united Germany, andThe burger has evolved from a simple meal to a global phenomenon,The role of fast food restaurants in its spread.Basic dough ingredients (beef, onions, spices).Comparison between cheddar, Swiss, Gouda, and blue cheese.",
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
