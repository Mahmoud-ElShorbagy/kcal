import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/widgets/custom_button.dart';

import '../../widgets/custom_logo.dart';
import '../../widgets/custom_text.dart';
import 'pages/eat_helthey/view.dart';
import 'pages/track_health/healthy_recipes/view.dart';
import 'pages/track_health/view.dart';
import 'page_indicator/view.dart';

class WalkthroughView extends StatefulWidget {
  const WalkthroughView({super.key});

  @override
  State<WalkthroughView> createState() => _WalkthroughViewState();
}

class _WalkthroughViewState extends State<WalkthroughView> {
  List<Widget> pages = const [EatHelthey(), HealthyRecipes(), TrackHealth()];
  int curntIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 90.h),
                height: 690.h,
                child: PageView.builder(
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return pages[index];
                  },
                  onPageChanged: (value) {
                    setState(() {
                      curntIndex = value;
                    });
                  },
                ),
              ),
              Positioned(
                  right: 30.w,
                  left: 30.w,
                  top: 520.h,
                  child: CustomButton(
                    text: "Get Started",
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.register);
                    },
                  )),
              SafeArea(
                  child: CustomLogoImage(
                margin: EdgeInsets.only(top: 65.h, left: 138.w, right: 138.w),
              )),
              Positioned(
                left: 50.w,
                right: 50.w,
                top: 590.h,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.login);
                  },
                  child: CustomText(
                    text: "Already Have An Acount? ",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "WorkSans",
                    color: AppColors.secondary,
                    textSpan: "Log In",
                  ),
                ),
              ),
              Positioned(
                  top: 476.h,
                  right: 160.w,
                  child: PageIndicator(
                    curntIndex: curntIndex,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
