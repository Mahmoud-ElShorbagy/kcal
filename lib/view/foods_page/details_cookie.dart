import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/view/foods_page/cubit/cubit.dart';
import 'package:kcal/widgets/app/custom_product_details.dart';

import '../../core/helpers/utils.dart';

class DetailsCookieView extends StatelessWidget {
  const DetailsCookieView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductFoodCubit(),
      child: BlocBuilder<ProductFoodCubit, ProductFoodState>(
        builder: (context, state) {
          final category = CategoryDTO(
            imageUrl: imagesFood[0],
            content: nameFoods[0],
          );
          final cubit = ProductFoodCubit.get(context);
          return CustomProductDetails(
            imageProduct: Utils.getAssetSVGPath("cookie"),
            imageGallery: Utils.getAssetPNGPath("co_galery"),
            imageGalleryPath: Utils.getAssetPNGPath("co_gal"),
            text: "Cookie",
            title: "Alternative Names: Biscuit",
            content:
                "A cookie is a baked or cooked food that is typically small, flat and sweet. It usually contains flour, sugar, egg, and some type of oil, fat, or butter. It may include other ingredients such as raisins, oats, chocolate chips, nuts, etc.",
            description:
                "In most English-speaking countries except for the United States, crunchy cookies are called biscuits. Many Canadians also use this term. Chewier biscuits are sometimes called cookies even in the United Kingdom.[3] Some cookies may also be named by their shape, such as date squares or bars.",
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
