import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/route_utils/route_generator.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/cubit/theme_cubit.dart';
import 'package:kcal/widgets/status_bar_color.dart';

import 'core/helpers/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    statusBarColor();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            final cubit = ThemeCubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: cubit.changeTheme
                  ? state.themeData
                  : ThemeData(scaffoldBackgroundColor: AppColors.white),
              onGenerateRoute: RouteGenerator.generateRoute,
              initialRoute: RouteNames.splash,
            );
          },
        ),
      ),
    );
  }
}
