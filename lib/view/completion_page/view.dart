import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/route_utils/route_names.dart';

import '../../core/helpers/app_colors.dart';
import '../../core/helpers/utils.dart';
import '../../widgets/custom_auth_header.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';

class CompletionPageView extends StatelessWidget {
  const CompletionPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        children: [
          const CustomAuthHeader(
            rmovetext: true,
            text: "All Done",
            title: "Thanks for giving us your precious",
            subTitle: """time. Now you are ready for a more
healthier and productive life.""",
          ),
          SizedBox(
            height: 50.h,
          ),
          CustomImageWidget(
              image: Utils.getAssetSVGPath("redy"),
              width: 260.w,
              height: 220.h),
          SizedBox(height: 48.h),
          Center(
              child: CustomButton(
                  text: "Let’s Go",
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteNames.appBottomNavigationBar);
                  })),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 16.h),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CustomText(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "WorkSans",
                color: AppColors.secondary,
                textSpan: "Back",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
