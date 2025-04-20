import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/view/foods_page/cubit.dart';
import 'package:kcal/widgets/app/custom_product_details.dart';

import '../../../core/helpers/utils.dart';

class DetailsCroissantView extends StatelessWidget {
  const DetailsCroissantView({
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
            imageUrl: imagesFood[8],
            content: nameFoods[8],
          );
          return CustomProductDetails(
            imageProduct: Utils.getAssetPNGPath("croissant"),
            imageGallery: Utils.getAssetjpgPath("cro"),
            imageGalleryPath: Utils.getAssetjpgPath("crt"),
            text: "Croissant",
            title: "Alternative Names: Croissant",
            content:
                "Mix the flour and salt in a bowl. ...Add the remaining milk, butter, eggs, and egg yolks, then knead for 4-5 minutes until you get a smooth dough. ...Roll out the dough on a floured surface and form a square approximately 30 x 30. ...Fold the four sides of the dough over and roll it up again. ...Roll out the dough on a floured surface to a thickness of 4 mm",
            description:
                "Mix the flour and salt in a bowl. ...Add the remaining milk, butter, eggs, and egg yolks, then knead for 4-5 minutes until you get a smooth dough. ...Roll out the dough on a floured surface and form a square approximately 30 x 30. ...Fold the four sides of the dough over and roll it up again. ...Roll out the dough on a floured surface to a thickness of 4 mm",
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
