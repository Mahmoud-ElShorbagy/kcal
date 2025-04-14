import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/widgets/build_final_resuilt.dart';
import 'package:kcal/widgets/custom_app_bar.dart';
import 'package:kcal/widgets/custom_button.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/custom_text.dart';

import 'custom_product_list_tile.dart';

class CustomProductDetails extends StatelessWidget {
  const CustomProductDetails({
    super.key,
    required this.imageProduct,
    required this.text,
    required this.title,
    required this.content,
    required this.description,
    required this.imageGallery,
    required this.imageGalleryPath,
    this.onTap,
    this.titleButton = "Add to favorite",
  });
  final void Function()? onTap;
  final String titleButton;
  final String imageProduct;
  final String text;
  final String title;
  final String content;
  final String description;
  final String imageGallery;
  final String imageGalleryPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
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
              SizedBox(height: 16.h),
              Container(
                width: 327.w,
                height: 80.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24).r,
                    color: AppColors.accentYellowLight100),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16)
                          .w,
                  child: CustomProductListTile(
                      imageProduct: imageProduct, text: text, title: title),
                ),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24).w,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomText(
                      letterSpacing: 0.1.sp,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "WorkSans",
                      text: content,
                      color: AppColors.secondaryText,
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    CustomText(
                      letterSpacing: 0.1.sp,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "WorkSans",
                      text: description,
                      color: AppColors.secondaryText,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    CustomText(
                      letterSpacing: 0.4.sp,
                      fontSize: 16.5.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "WorkSans",
                      text: "Galery",
                      color: AppColors.subTitle400,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        CustomImageWidget(
                          fit: BoxFit.cover,
                          image: imageGallery,
                          width: 140.w,
                          height: 242.h,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        CustomImageWidget(
                          fit: BoxFit.cover,
                          image: imageGalleryPath,
                          width: 140.w,
                          height: 242.h,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    buildFinalReuilt()
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 64.h,
              child: CustomButton(text: titleButton, onTap: onTap)),
        ],
      ),
    );
  }
}
