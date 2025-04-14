import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/widgets/custom_icon_close.dart';
import 'package:kcal/widgets/custom_text.dart';

class ServiceTermsPage extends StatelessWidget {
  const ServiceTermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            CustomIconClose(
              title: "Terms of Sevice",
              image: "close",
              onTap: () => Navigator.pop(context),
            ),
            Expanded(
              child: ListView(
                children: [
                  CustomText(
                    letterSpacing: 0.5.sp,
                    color: AppColors.secondaryText,
                    fontSize: 15.5.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "WorkSans",
                    text: '''
These terms and conditions ("Agreement") set forth the general terms and conditions of your use of the "kcal" mobile application ("Mobile Application" or "Service") and any of its related products and services (collectively, "Services"). This Agreement is legally binding between you ("User", "you" or "your") and this Mobile Application developer ("Operator", "we", "us" or "our"). By accessing and using the Mobile Application and Services, you acknowledge that you have read, understood, and agree to be bound by the terms of this Agreement. If you are entering into this Agreement on behalf of a business or other legal entity, you represent that you have the authority to bind such entity to this Agreement, in which case the terms "User", "you" or "your" shall refer to such entity. If you do not have such authority, or if you do not agree with the terms of this Agreement, you must not accept this Agreement and may not access and use the Mobile Application and Services. You acknowledge that this Agreement is a contract between you and the Operator, even though it is electronic and is not physically signed by you, and it governs your use of the Mobile Application and Services. This terms and conditions policy was created with the help of the terms and conditions generator.
              ''',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
