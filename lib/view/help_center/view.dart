import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/widgets/build_row_setting.dart';
import 'package:kcal/widgets/custom_app_bar.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/custom_text_body.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 13.h),
          SafeArea(
              child: CustomAppBar(
                  title: "Help Center",
                  tapBack: () {
                    Navigator.pop(context);
                  })),
          SizedBox(height: 13.h),
          Expanded(
              child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  children: [
                CustomImageWidget(
                    image: Utils.getAssetSVGPath("help_center"),
                    width: 282.w,
                    height: 240.h),
                SizedBox(height: 16.h),
                CustomTextBody(
                    changeFontSize: true,
                    fontSizedBig: 22.sp,
                    fontSizeSmall: 13.sp,
                    text: "24 x 7 Help Center",
                    title: "We are all here on earth to help others; what",
                    subTitle: "on earth the others are here for I don't know."),
                SizedBox(
                  height: 40.h,
                ),
                CustomBuildRowSetting(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.chatWithUs);
                  },
                  imageIcon: "chat",
                  text: "Chat With Us",
                  image: "foraward_grey",
                ),
                SizedBox(height: 16.h),
                CustomBuildRowSetting(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.faqs);
                  },
                  imageIcon: "help_center",
                  text: "FAQs",
                  image: "foraward_grey",
                ),
              ])),
        ],
      ),
    );
  }
}
