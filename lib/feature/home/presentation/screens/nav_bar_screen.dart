import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/feature/home/presentation/screens/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavBarScreen extends StatelessWidget {
  final int? index;

  const NavBarScreen({super.key, this.index = 0});

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomeScreen(),
      const Center(child: Text('Search')),
      const Center(child: Text('Favorites')),
      const Center(child: Text('My Posts')),
      const Center(child: Text('Profile')),
    ];
    return PersistentTabView(
      context,
      screens: screens,
      controller: PersistentTabController(initialIndex: index ?? 0),

      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: 'Home',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),

        PersistentBottomNavBarItem(
          icon: const Icon(Icons.search),
          title: 'Search',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),

        PersistentBottomNavBarItem(
          icon: const Icon(Icons.add, color: Colors.white),
        ),

        PersistentBottomNavBarItem(
          icon: const Icon(Icons.notifications),
          title: 'Notifications',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),

        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: 'Profile',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ],
      navBarStyle: NavBarStyle.style15,
      backgroundColor: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 7.h),
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.white,
        border: Border(top: BorderSide(width: 1, color: Color(0xffE0E5ED))),
      ),
    );
  }
}
