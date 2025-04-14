import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kcal/view/app_tap_bar/cubit.dart';

import '../../core/helpers/app_colors.dart';
import '../../widgets/custom_build_row_time.dart';

class BuildRowTimeView extends StatelessWidget {
  const BuildRowTimeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextChangeCubit(),
      child: BlocBuilder<TextChangeCubit, TextChangeState>(
        builder: (context, state) {
          final cubit = TextChangeCubit.get(context);
          return Row(
            children: [
              buildRowTime(
                "15 min",
                state.activeText == 1
                    ? AppColors.primaryLightGreen400
                    : AppColors.primaryLightGreen100,
                AppColors.primaryDarkGreen900,
                () {
                  cubit.updateText(1);
                },
              ),
              buildRowTime(
                "30 min",
                state.activeText == 2
                    ? AppColors.primaryLightGreen400
                    : AppColors.primaryLightGreen100,
                AppColors.primaryDarkGreen900,
                () {
                  cubit.updateText(2);
                },
              ),
              buildRowTime(
                  "45 min",
                  state.activeText == 3
                      ? AppColors.primaryLightGreen400
                      : AppColors.primaryLightGreen100,
                  AppColors.primaryDarkGreen900, () {
                cubit.updateText(3);
              }),
              buildRowTime(
                  "0 hour",
                  state.activeText == 4
                      ? AppColors.primaryLightGreen400
                      : AppColors.primaryLightGreen100,
                  AppColors.primaryDarkGreen900, () {
                cubit.updateText(4);
              }),
            ],
          );
        },
      ),
    );
  }
}
