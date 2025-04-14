import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/route_utils/route_utils.dart';
import 'package:kcal/widgets/build_final_resuilt.dart';
import 'package:kcal/widgets/custom_app_bar.dart';

import '../../models/foods_variables.dart';
import '../../widgets/app/custom_product_list.dart';

class FoodsPageView extends StatelessWidget {
  const FoodsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 16.h),
          SafeArea(
            child: CustomAppBar(
              tapBack: () {
                Navigator.of(context).pop();
              },
              title: "Foods",
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView(
              children: [
                Center(
                  child: Wrap(
                    spacing: 8.w,
                    direction: Axis.horizontal,
                    children: List.generate(
                      categoryFoods.length,
                      (index) => CutsomProductList(
                        image: categoryFoods[index].imageUrl,
                        text: categoryFoods[index].content,
                        onTap: () {
                          RouteUtils.navigateToCategoryFoods(
                              categoryFoods[index], context);
                        },
                      ),
                    ),
                  ),
                ),
                buildFinalReuilt()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
