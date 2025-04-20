import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/auth/register/cubit.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../widgets/custom_text.dart';

class TitleView extends StatelessWidget {
  const TitleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Column(
        children: [
          SizedBox(height: 24.h),
          SafeArea(
            child: BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                final cubit = RegisterCubit.get(context);
                return Column(
                  children: [
                    CustomText(
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "WorkSans",
                      textSpan: "Hello ${cubit.nameController.text},",
                    )
                  ],
                );
              },
            ),
          ),
          CustomText(
            color: AppColors.subTitle100,
            letterSpacing: 0.3.sp,
            fontSize: 15.5.sp,
            fontWeight: FontWeight.w400,
            fontFamily: "WorkSans",
            text: "Here’s your curated home feed",
          ),
          SizedBox(height: 16.h)
        ],
      ),
    );
  }
}
