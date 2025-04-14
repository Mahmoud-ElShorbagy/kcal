import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/view/foods_page/cubit/cubit.dart';
import 'package:kcal/widgets/app/custom_product_details.dart';

class DetailsHotDogsView extends StatelessWidget {
  const DetailsHotDogsView({
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
            imageUrl: imagesFood[6],
            content: nameFoods[6],
          );
          return CustomProductDetails(
            imageProduct: Utils.getAssetSVGPath("hotdog"),
            imageGallery: Utils.getAssetjpgPath("hotdogo"),
            imageGalleryPath: Utils.getAssetjpgPath("hotdogt"),
            text: "HotDog",
            title: "Alternative Names: HotDog",
            content:
                "HotDogs are a type of sausage made from liver, kidneys, and tripe, with added meat and seasonings. They are a popular dish representing American culture, which emerged after the Civil War in the 19th century.",
            description:
                "When it comes to the ingredients that go into hot dogs, the National Hot Dog and Sausage Council (NHDSC) writes that “all hot dogs are processed and cooked sausages consisting primarily of pork, beef, chicken, turkey, or a combination of meat and poultry.” ",
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
