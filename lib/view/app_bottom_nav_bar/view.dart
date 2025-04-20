import 'package:flutter/material.dart';
import 'package:kcal/view/favorites_page/view.dart';
import 'package:kcal/view/home/view.dart';
import 'package:kcal/view/profile/view.dart';
import 'package:kcal/view/search/view.dart';

import '../../core/helpers/app_colors.dart';
import '../../widgets/custom_widget_icon.dart';
import '../home/camera/view.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final void Function(int)? onTabChange;
  const AppBottomNavigationBar({super.key, this.onTabChange});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int selectedIndex = 0;
  late final List<Widget> widgetOptions;
  void _changeTab(int index) {
    setState(() => selectedIndex = index);

    widget.onTabChange?.call(index);
  }

  @override
  void initState() {
    widgetOptions = <Widget>[
      const HomeView(),
      const SearchView(),
      const CameraView(),
      FavoriteView(
        onTabRequested: _changeTab,
      ),
      const ProfileView(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        onTap: (value) {
          setState(() => selectedIndex = value);
          _changeTab(value);
        },
        fixedColor: selectedIndex == 2
            ? AppColors.darkGreen600
            : AppColors.textPrimary100,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
              tooltip: "home",
              icon: CustomWidgetIcon(
                image: selectedIndex == 0 ? "home_active" : "home",
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              tooltip: "search",
              icon: CustomWidgetIcon(
                image: selectedIndex == 1 ? "search_active" : "search",
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
                image: selectedIndex == 3 ? "favurite_active" : "favurite",
              ),
              label: 'favorite'),
          BottomNavigationBarItem(
              tooltip: "profile",
              icon: CustomWidgetIcon(
                image: selectedIndex == 4 ? "profile_active" : "profile",
              ),
              label: 'profile'),
        ],
      ),
    );
  }
}
