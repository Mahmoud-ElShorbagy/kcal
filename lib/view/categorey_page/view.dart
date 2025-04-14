import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/route_utils/route_names.dart';

import '../../models/category_variables.dart';
import '../../widgets/app/custom_categorey.dart';
import '../walkthrough/page_indicator/view.dart';

class CategoreyPageView extends StatefulWidget {
  const CategoreyPageView({
    super.key,
  });

  @override
  State<CategoreyPageView> createState() => _CategoreyPageViewState();
}

class _CategoreyPageViewState extends State<CategoreyPageView> {
  int curntIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 140.h,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                curntIndex = value;
              });
            },
            physics: const BouncingScrollPhysics(),
            itemCount: category.length,
            itemBuilder: (context, index) {
              return CustomCategoreyPage(
                title: "RECIPE",
                content: category[index].content,
                titleButton: titleButton[index],
                onTap: () {
                  if (index == 0) {
                    Navigator.pushNamed(context, RouteNames.detailsBurger);
                  } else if (index == 1) {
                    Navigator.pushNamed(context, RouteNames.detailsPasta);
                  } else if (index == 2) {
                    Navigator.pushNamed(context, RouteNames.detailsFruits);
                  }
                },
                image: image[index],
              );
            },
          ),
        ),
        Positioned(
            top: 156.h,
            left: 125.w,
            child: PageIndicator(curntIndex: curntIndex)),
      ],
    );
  }
}
