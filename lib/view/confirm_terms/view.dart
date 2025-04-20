import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/view/navigate_to_page/view.dart';

import '../../core/helpers/utils.dart';
import '../../core/route_utils/route_names.dart';
import '../../widgets/custom_auth_header.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image.dart';

class ConfirmTermsPageView extends StatelessWidget {
  const ConfirmTermsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        children: [
          const CustomAuthHeader(
              text: "One Last Step",
              title: "Before we continue, please make",
              subTitle: """sure you read and accept our terms
of service and privacy policy.""",
              pageNumber: "4/4"),
          SizedBox(
            height: 50.h,
          ),
          CustomImageWidget(
              image: Utils.getAssetSVGPath("groub"),
              width: 260.w,
              height: 220.h),
          SizedBox(height: 48.h),
          Center(
              child: CustomButton(
                  text: "Accept",
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.completion);
                  })),
          NavigateToPage.navigateToPage(context, () {
            Navigator.pushNamed(context, RouteNames.serviceTerms);
          }, "", "Terms Of Service")
        ],
      ),
    );
  }
}
