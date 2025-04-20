import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/route_utils/route_generator.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/core/route_utils/route_utils.dart';
import 'package:kcal/cubit/theme_cubit.dart';

import 'core/helpers/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.primary));
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
              routes: AppRoutes.appRoutes,
              theme: cubit.changeTheme
                  ? state.themeData
                  : ThemeData(scaffoldBackgroundColor: AppColors.white),
              onGenerateRoute: RouteGenerator.generateRoute,
              initialRoute: RouteUtils.getIntialRoute(),
            );
          },
        ),
      ),
    );
  }
}
