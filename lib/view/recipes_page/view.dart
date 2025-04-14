import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kcal/view/build_show_modal_bottom/view.dart';
import 'package:kcal/widgets/build_final_resuilt.dart';

import '../../widgets/custom_app_bar.dart';
import '../app_tap_bar/custom_recipe_page/all_recipes.dart';

class RecipesPageView extends StatelessWidget {
  const RecipesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 16.h),
          SafeArea(
            child: CustomAppBar(
              onTap: () {
                buildShowModalBottomSheet(context);
              },
              tapBack: () {
                Navigator.pop(context);
              },
              title: "Recipes",
              titleFilter: "Filters",
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView(
              children: [
                const CustomAllRecipesView(
                  changeIndex: true,
                ),
                buildFinalReuilt(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
