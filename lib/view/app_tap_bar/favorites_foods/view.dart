import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/route_utils/route_utils.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/view/foods_page/cubit.dart';
import 'package:kcal/view/no_result/view.dart';
import 'package:kcal/widgets/app/custom_product_list.dart';
import 'package:kcal/widgets/build_final_resuilt.dart';
import 'package:kcal/widgets/circular_indicator.dart';

List<CategoryDTO> productFoods = [];

class FavoritesFoodsView extends StatelessWidget {
  const FavoritesFoodsView({
    super.key,
    this.changeHeightSizedBox = false,
  });
  final bool changeHeightSizedBox;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductFoodCubit(),
      child: BlocBuilder<ProductFoodCubit, ProductFoodState>(
        builder: (context, state) {
          if (state is ProductFoodLoading && productFoods.isNotEmpty) {
            return const CircularIndicator();
          }
          if (productFoods.isEmpty) {
            return const CustomNoResultPage(
              image: "diet",
              text: "No Foods Found",
              title: "You don’t save any food. Go ahead,",
              subTitle: " search and save your favorite food.",
            );
          } else {
            return Column(
              children: [
                Wrap(
                  spacing: 8.w,
                  direction: Axis.horizontal,
                  children: List.generate(productFoods.length, (index) {
                    final product = productFoods[index];
                    return CutsomProductList(
                      image: product.imageUrl,
                      text: product.content,
                      onTap: () {
                        RouteUtils.navigateToCategoryFoods(product, context);
                      },
                    );
                  }),
                ),
                if (productFoods.length > 9) buildFinalReuilt(),
                SizedBox(height: changeHeightSizedBox ? 0.h : 80.h),
              ],
            );
          }
        },
      ),
    );
  }
}
