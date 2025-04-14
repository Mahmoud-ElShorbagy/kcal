import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/view/foods_page/cubit/cubit.dart';
import 'package:kcal/widgets/app/custom_product_details.dart';

class DetailsFriesView extends StatelessWidget {
  const DetailsFriesView({
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
            imageUrl: imagesFood[5],
            content: nameFoods[5],
          );
          return CustomProductDetails(
            imageProduct: Utils.getAssetSVGPath("fries"),
            imageGallery: Utils.getAssetjpgPath("frieso"),
            imageGalleryPath: Utils.getAssetjpgPath("friest"),
            text: "Fries",
            title: "Alternative Names: Fries",
            content:
                "Cupcakes are made from flour, sugar, eggs, milk, baking powder, butter, vanilla, and salt. For frosting, use butter, sugar, vanilla, and cornstarch. This cake is high in calories because it contains a high amount of fat, especially from the use of butter.",
            description:
                "Cupcakes are made from flour, sugar, eggs, milk, baking powder, butter, vanilla, and salt. For frosting, use butter, sugar, vanilla, and cornstarch. This cake is high in calories because it contains a high amount of fat, especially from the use of butter.",
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
