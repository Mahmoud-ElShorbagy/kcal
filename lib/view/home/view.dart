import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/view/categorey_page/view.dart';
import 'package:kcal/widgets/app/custom_categorey.dart';
import 'package:kcal/widgets/build_final_resuilt.dart';

import '../../core/helpers/utils.dart';
import '../../core/route_utils/route_names.dart';
import '../app_tap_bar/view.dart';
import '../show_all/view.dart';
import '../trending_recipes/view.dart';
import 'units/title_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          const TitleView(),
          const CategoreyPageView(),
          SizedBox(height: 42.h),
          Expanded(
            child: ListView(
              children: [
                const TrendingRecipesView(),
                SizedBox(
                  height: 25.h,
                ),
                ShowAllView(
                  title: "Foods",
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.foodsPage);
                  },
                ),
                SizedBox(height: 8.h),
                const AppTapBarView(),
                SizedBox(
                  height: 32.h,
                ),
                ShowAllView(
                  title: "Recipes",
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.recipesPage);
                  },
                ),
                SizedBox(height: 8.h),
                const AppTapBarView(
                  changeTapBar: true,
                ),
                SizedBox(height: 16.h),
                CustomCategoreyPage(
                    onTap: () {},
                    title: "24x7 Help Center",
                    content: """Have A Query?
Chat With Us.""",
                    titleButton: "Contact Us",
                    image: Utils.getAssetSVGPath("contact_us")),
                buildFinalReuilt(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
