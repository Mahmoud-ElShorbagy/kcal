import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/view/foods_page/cubit/cubit.dart';
import 'package:kcal/widgets/app/custom_product_details.dart';

class DetailsDonutsView extends StatelessWidget {
  const DetailsDonutsView({
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
            imageUrl: imagesFood[4],
            content: nameFoods[4],
          );
          return CustomProductDetails(
            imageProduct: Utils.getAssetSVGPath("donuts"),
            imageGallery: Utils.getAssetjpgPath("donutso"),
            imageGalleryPath: Utils.getAssetjpgPath("donutst"),
            text: "Donuts",
            title: "Alternative Names: Donuts",
            content:
                "Donuts are typically fried from flour batter, but other types of batter can also be used. Various toppings and flavorings are used for different types, such as sugar, chocolate, or maple glaze. Doughnuts may also contain water, leavening agents, eggs, milk, sugar, oil, margarine, and natural or artificial flavors.",
            description:
                "In their simplest form, donuts are made from a dough typically made from a mixture of flour, water, sugar, eggs, and a leavening agent, usually yeast or baking powder. The dough is then shaped into rounds or other shapes, fried in hot oil until golden brown, and then covered with sugar, glaze, or other toppings.",
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
