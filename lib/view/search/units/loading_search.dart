import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/view/no_result/view.dart';

Container loadingSearch() {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(top: 100.h),
    child: const CustomNoResultPage(
        width: 100,
        height: 100,
        image: "loading_spinner",
        title: "Please wait a moment.",
        subTitle: " We are processing your search request."),
  );
}
