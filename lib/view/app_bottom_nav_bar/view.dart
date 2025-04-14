import 'package:flutter/material.dart';
import 'package:kcal/view/favorites_page/view.dart';
import 'package:kcal/view/home/view.dart';
import 'package:kcal/view/profile/view.dart';
import 'package:kcal/view/search/view.dart';

import '../../core/helpers/app_colors.dart';
import '../../widgets/custom_widget_icon.dart';
import '../home/camera/view.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int index = 0;
  static const List<Widget> widgetOptions = <Widget>[
    HomeView(),
    SearchView(),
    CameraView(),
    FavoriteView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions[index],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        onTap: (value) => setState(() => index = value),
        fixedColor:
            index == 2 ? AppColors.darkGreen600 : AppColors.textPrimary100,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
              tooltip: "home",
              icon: CustomWidgetIcon(
                image: index == 0 ? "home_active" : "home",
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              tooltip: "search",
              icon: CustomWidgetIcon(
                image: index == 1 ? "search_active" : "search",
              ),
              label: 'search'),
          const BottomNavigationBarItem(
              tooltip: "camera",
              icon: CustomWidgetIcon(
                image: "camera",
                width: 40,
                height: 40,
              ),
              label: 'camera'),
          BottomNavigationBarItem(
              tooltip: "favorite",
              icon: CustomWidgetIcon(
                image: index == 3 ? "favurite_active" : "favurite",
              ),
              label: 'favorite'),
          BottomNavigationBarItem(
              tooltip: "profile",
              icon: CustomWidgetIcon(
                image: index == 4 ? "profile_active" : "profile",
              ),
              label: 'profile'),
        ],
      ),
    );
  }
}
