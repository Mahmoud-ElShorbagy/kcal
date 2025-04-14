import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/view/app_tap_bar/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/view/managers/state_handler.dart';
import '../../core/helpers/app_colors.dart';
import '../../widgets/custom_text.dart';

class AppTapBarView extends StatelessWidget {
  const AppTapBarView({super.key, this.changeTapBar = false});
  final bool changeTapBar;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextChangeCubit(),
      child: BlocBuilder<TextChangeCubit, TextChangeState>(
        builder: (context, state) {
          final cubit = TextChangeCubit.get(context);
          return Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      cubit.updateText(0);
                    },
                    child: CustomText(
                        color: state.activeText == 0
                            ? AppColors.subTitle400
                            : AppColors.baseGreen,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "WorkSans",
                        text: "All"),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  InkWell(
                    onTap: () {
                      cubit.updateText(1);
                    },
                    child: CustomText(
                        color: state.activeText == 1
                            ? AppColors.subTitle400
                            : AppColors.baseGreen,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "WorkSans",
                        text: "Favorites"),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  InkWell(
                    onTap: () {
                      cubit.updateText(2);
                    },
                    child: CustomText(
                        color: state.activeText == 2
                            ? AppColors.subTitle400
                            : AppColors.baseGreen,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "WorkSans",
                        text: "Trending"),
                  ),
                ],
              ),
              StateHandler.buildChangeTapBar(changeTapBar, state),
            ],
          );
        },
      ),
    );
  }
}
