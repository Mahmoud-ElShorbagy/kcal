import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/core/route_utils/route_utils.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/status_bar_color.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  @override
  void initState() {
    initTimer();
    super.initState();
  }

  Future<void> initTimer() async {
    _timer = Timer(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(
        context,
        RouteUtils.getIntialRoute(),
      );
      Future.delayed(const Duration(milliseconds: 110), () {
        statusBarColor();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    statusBarColor(AppColors.primaryBaseGreen);
    return Scaffold(
      backgroundColor: AppColors.primaryBaseGreen,
      body: CustomImageWidget(
        image: Utils.getAssetPNGPath("splash_kcal"),
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
