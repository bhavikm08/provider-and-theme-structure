import 'package:flutter/material.dart';
import 'package:providerstructure/Screens/bottom_navigation_bar/info/profile_screen.dart';
import 'package:providerstructure/Screens/bottom_navigation_bar/settings/setting.dart';

import 'login_view/login_view.dart';

class BottomTabScreen extends StatefulWidget {
  const BottomTabScreen({Key? key}) : super(key: key);

  @override
  State<BottomTabScreen> createState() => BottomTabScreenState();
}

class BottomTabScreenState extends State<BottomTabScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      const LoginView();
      const ProfileScreen();
      const Setting();
    });
  }

  final List<Widget> pages = [
    const LoginView(),
    const ProfileScreen(),
    const Setting(),
  ];
  static int selectPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectPageIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).textTheme.bodyLarge?.color,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],

      ),
      body: pages[selectPageIndex],
    );
  }
}
