import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/view/foods_page/cubit.dart';
import 'package:kcal/widgets/app/custom_product_details.dart';

import '../../../core/helpers/utils.dart';

class DetailsSausageView extends StatelessWidget {
  const DetailsSausageView({
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
            imageUrl: imagesFood[14],
            content: nameFoods[14],
          );
          return CustomProductDetails(
            imageProduct: Utils.getAssetPNGPath("sausage"),
            imageGallery: Utils.getAssetjpgPath("sausageo"),
            imageGalleryPath: Utils.getAssetjpgPath("sausaget"),
            text: "Sausage",
            title: "Alternative Names: Sausage",
            content:
                "Bring a large skillet to a boil over medium heat. Place the sausage in the skillet and brown until browned, then remove it from the heat. Return the skillet to the heat, add the olive oil, and heat slightly. Then add the onions, peppers, salt, and peppers. Sauté the ingredients together until the water has evaporated and the vegetables are very tender and golden.",
            description:
                "Bring a large skillet to a boil over medium heat. Place the sausage in the skillet and brown until browned, then remove it from the heat. Return the skillet to the heat, add the olive oil, and heat slightly. Then add the onions, peppers, salt, and peppers. Sauté the ingredients together until the water has evaporated and the vegetables are very tender and golden.Bring a large skillet to a boil over medium heat. Place the sausage in the skillet and brown until browned, then remove it from the heat. Return the skillet to the heat, add the olive oil, and heat slightly. Then add the onions, peppers, salt, and peppers. Sauté the ingredients together until the water has evaporated and the vegetables are very tender and golden.",
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
