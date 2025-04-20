import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/view/app_tap_bar/cubit.dart';
import 'package:kcal/view/managers/state_handler.dart';
import 'package:kcal/widgets/custom_text.dart';

import '../../core/helpers/app_colors.dart';

class FavoriteView extends StatelessWidget {
  final void Function(int)? onTabRequested;
  const FavoriteView({super.key, required this.onTabRequested});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextChangeCubit(),
      child: BlocBuilder<TextChangeCubit, TextChangeState>(
        builder: (context, state) {
          final cubit = TextChangeCubit.get(context);
          return Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 13.h),
                  SafeArea(
                    child: Center(
                      child: CustomText(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "WorkSans",
                        text: "Favorites",
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25).w,
                    child: Row(children: [
                      InkWell(
                        onTap: () {
                          cubit.updateText(0);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 154.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                  left: const Radius.circular(16).r),
                              color: state.activeText == 0
                                  ? AppColors.primaryBaseGreen
                                  : AppColors.primaryLightGreen100),
                          child: CustomText(
                              letterSpacing: 0.2.sp,
                              color: state.activeText == 0
                                  ? AppColors.white
                                  : AppColors.primaryBaseGreen,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "WorkSans",
                              text: "Foods"),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cubit.updateText(1);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 44.h,
                          width: 154.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                  right: const Radius.circular(16).r),
                              color: state.activeText == 1
                                  ? AppColors.primaryBaseGreen
                                  : AppColors.primaryLightGreen100),
                          child: CustomText(
                              letterSpacing: 0.2.sp,
                              color: state.activeText == 1
                                  ? AppColors.white
                                  : AppColors.primaryBaseGreen,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "WorkSans",
                              text: "Recipes"),
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: ListView(
                      children: [StateHandler.buildChangeSizeMargin(state)],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 20.h,
                child: StateHandler.buildSearchButtonWhenEmpty(
                  state,
                  onTap: () {
                    onTabRequested?.call(1);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
