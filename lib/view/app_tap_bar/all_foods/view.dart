import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/route_utils/route_utils.dart';
import 'package:kcal/models/foods_variables.dart';

import '../../../widgets/app/custom_product_list.dart';

class AllFoodsView extends StatelessWidget {
  const AllFoodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Wrap(
          spacing: 8.w,
          direction: Axis.horizontal,
          children: List.generate(
            6,
            (index) {
              return CutsomProductList(
                image: categoryFoods[index].imageUrl,
                text: categoryFoods[index].content,
                onTap: () {
                  RouteUtils.navigateToCategoryFoods(
                      categoryFoods[index], context);
                },
              );
            },
          )),
    );
  }
}
