import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/route_utils/route_utils.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/view/search/cubit.dart';
import 'package:kcal/widgets/app/custom_product_list.dart';

class ResultSearchFoodsView extends StatelessWidget {
  const ResultSearchFoodsView({
    super.key,
    required this.cubit,
    required this.filteredFoods,
    required this.allFoods,
  });

  final SearchCubit cubit;
  final List<CategoryDTO> filteredFoods;
  final List<CategoryDTO> allFoods;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 8.w,
        direction: Axis.horizontal,
        children: List.generate(
          cubit.myController.text.contains("foo") ? 6 : allFoods.length,
          (index) => CutsomProductList(
            image: allFoods[index].imageUrl,
            text: allFoods[index].content,
            onTap: () {
              RouteUtils.navigateToCategoryFoods(allFoods[index], context);
            },
          ),
        ),
      ),
    );
  }
}
