import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/bottom_navigation/_bottom_navigation_exporter.dart';
import 'package:mobile/pages/favorite/_favorite_exporter.dart';
import 'package:mobile/pages/home/_home_page_exporter.dart';
import 'package:mobile/pages/profile/_profile_exporter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  AccountController accountController = Get.find();
  late PersistentTabController _controller;
  RxInt indexX = 1.obs;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: indexX.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(
          () => Text(
            getTitle(),
            style: KTextStyle.h1(
              textStyleBase: const TextStyleBase(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () {
          indexX.value;
          return PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            navBarHeight:
                MediaQuery.of(context).viewInsets.bottom > 0 ? 0.0 : kBottomNavigationBarHeight,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 400),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style2,
            onItemSelected: (i) => indexX.value = i,
          );
        },
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const FavoriteScreen(),
      HomePage(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_outlined),
        activeColorPrimary: KColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
        iconSize: 32,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        activeColorPrimary: KColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
        iconSize: 32,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        activeColorPrimary: KColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
        iconSize: 32,
      ),
    ];
  }

  String getTitle() {
    switch (indexX.value) {
      case 0:
        return BottomNavigationConstants.MY_FAVORITES;
      case 1:
        return BottomNavigationConstants.HOME;
      case 2:
        return BottomNavigationConstants.MY_PROFILE;
      default:
        return "";
    }
  }
}
