import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/widgets/custom_app_bar.dart';
import 'package:kcal/widgets/custom_button.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/custom_text_body.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 13.h),
          SafeArea(
              child: CustomAppBar(
            tapBack: () => Navigator.pop(context),
            title: "Chat With Us",
          )),
          SizedBox(height: 13.h),
          Expanded(
              child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  children: [
                CustomImageWidget(
                    image: Utils.getAssetSVGPath("chat_us"),
                    width: 282.w,
                    height: 240.h),
                SizedBox(height: 16.h),
                CustomTextBody(
                    changeFontSize: true,
                    fontSizedBig: 22.sp,
                    fontSizeSmall: 13.sp,
                    text: "Message Sent",
                    title: "Our support team will reach out to you within",
                    subTitle: "3 days. We’ll also notify you within the app."),
                SizedBox(
                  height: 145.h,
                ),
                CustomButton(
                    text: "Back to home",
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteNames.appBottomNavigationBar);
                    }),
              ])),
        ],
      ),
    );
  }
}
