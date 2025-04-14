import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/view/product_recipes/units/steps_recipes_view.dart';
import 'package:kcal/widgets/build_final_resuilt.dart';
import 'package:kcal/widgets/custom_build_row_deatails.dart';
import 'package:kcal/widgets/custom_button.dart';
import 'package:kcal/widgets/custom_image.dart';

import '../../core/helpers/app_colors.dart';
import '../../view/product_recipes/units/build_deatails_product.dart';
import '../../view/product_recipes/units/build_row_title.dart';
import '../custom_app_bar.dart';

class CustomRecipesDetails extends StatelessWidget {
  final String imagePath;
  final String imageIcon;
  final String textTime;
  final String serve;
  final String title;
  final String text;
  final void Function()? onTap;
  const CustomRecipesDetails(
      {super.key,
      required this.imagePath,
      required this.textTime,
      required this.serve,
      required this.title,
      this.onTap,
      required this.imageIcon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: 13.h),
              SafeArea(
                  child: CustomAppBar(
                title: "Recipes",
                tapBack: () {
                  Navigator.pop(context);
                },
              )),
              SizedBox(height: 24.h),
              CustomImageWidget(
                image: Utils.getAssetPNGPath(imagePath),
                width: double.infinity.w,
                height: 150.h,
              ),
              SizedBox(height: 13.h),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 22).w,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 22).w,
                        width: 327.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16).r,
                          color: AppColors.accentYellowLight100,
                        ),
                        child: buildRowDetailsRecipes(textTime, serve)),
                    SizedBox(height: 13.h),
                    buildRowTitleWithIcon(title, imageIcon),
                    SizedBox(height: 13.h),
                    buildDetaislProduct(),
                    SizedBox(height: 13.h),
                    const StepsRecipesView(),
                    buildFinalReuilt(),
                    SizedBox(height: 110.h),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 64,
              child: CustomButton(
                text: text,
                onTap: onTap,
              )),
        ],
      ),
    );
  }
}
