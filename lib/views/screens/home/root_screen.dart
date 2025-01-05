import 'package:flutter/material.dart';

import '../../../core/utils/constant/colors.dart';
import '../../widgets/image/local_image.dart';
import '../profile/my_profile_screen.dart';
import '../../../core/utils/extensions.dart';
import 'screens/dashboard_screen.dart';

class NavRoute {
  final String name;
  final String image;
  final Widget screen;
  final Function() onTap;

  NavRoute(
      {required this.name,
      required this.image,
      required this.onTap,
      required this.screen});
}

class RootScreen extends StatefulWidget {
  static const path = "/$routeName";
  static const routeName = "home";

  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int index = 0;
  String? selectedRouteName;
  List<NavRoute> navRoutes = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      navRoutes.addAll([
        NavRoute(
            name: "Home",
            screen: const DashboardScreen(),
            image: "house_filled".pngIcon,
            onTap: () {
              setState(() {
                index = 1;
              });
            }),
        NavRoute(
            name: "Profile",
            screen: const MyProfileScreen(),
            image: "profile_user".pngIcon,
            onTap: () {
              setState(() {
                index = 0;
              });
            })
      ]);

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navRoutes[index].screen,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        backgroundColor: AppColors.buttonColor,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.primaryVariant,
        onTap: (value) {
          setState(() {
            index = value;
            selectedRouteName = navRoutes[value].name;
          });
        },
        items: navRoutes
            .map((e) => BottomNavigationBarItem(
                label: e.name,
                icon: LocalImage(
                  imagePath: e.image,
                  width: 30,
                  height: 30,
                  color: selectedRouteName == e.name
                      ? AppColors.white
                      : AppColors.primaryVariant,
                )))
            .toList(),
      ),
    );
  }
}
