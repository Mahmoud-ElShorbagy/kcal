import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/view/foods_page/cubit.dart';
import 'package:kcal/widgets/app/custom_product_details.dart';

import '../../../core/helpers/utils.dart';

class DetailsFruitsView extends StatelessWidget {
  const DetailsFruitsView({
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
            imageUrl: imagesFood[16],
            content: nameFoods[16],
          );
          return CustomProductDetails(
            imageProduct: Utils.getAssetPNGPath("vegetable"),
            imageGallery: Utils.getAssetjpgPath("fruito"),
            imageGalleryPath: Utils.getAssetjpgPath("fruitst"),
            text: "Fruits",
            title: "Alternative Names: Fruits",
            content:
                "Half a bag of frozen mango, half a cup of liquid milk, a cup of mango juice. Mix them in a blender and pour it over the fruits. Mix them with some fruits. Optional: I chose pomegranate + berries + strawberries + mango + kiwi. Syrian fruit salad method. Low-calorie salad.Half a bag of frozen mango, half a cup of liquid milk, a cup of mango juice. Mix them in a blender and pour it over the fruits. Mix them with some fruits. Optional: I chose pomegranate + berries + strawberries + mango + kiwi. Syrian fruit salad method. Low-calorie salad.Half a bag of frozen mango, half a cup of liquid milk, a cup of mango juice. Mix them in a blender and pour it over the fruits. Mix them with some fruits. Optional: I chose pomegranate + berries + strawberries + mango + kiwi. Syrian fruit salad method. Low-calorie salad.",
            description:
                "Half a bag of frozen mango, half a cup of liquid milk, a cup of mango juice. Mix them in a blender and pour it over the fruits. Mix them with some fruits. Optional: I chose pomegranate + berries + strawberries + mango + kiwi. Syrian fruit salad method. Low-calorie salad.Half a bag of frozen mango, half a cup of liquid milk, a cup of mango juice. Mix them in a blender and pour it over the fruits. Mix them with some fruits. Optional: I chose pomegranate + berries + strawberries + mango + kiwi. Syrian fruit salad method. Low-calorie salad.Half a bag of frozen mango, half a cup of liquid milk, a cup of mango juice. Mix them in a blender and pour it over the fruits. Mix them with some fruits. Optional: I chose pomegranate + berries + strawberries + mango + kiwi. Syrian fruit salad method. Low-calorie salad.",
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
