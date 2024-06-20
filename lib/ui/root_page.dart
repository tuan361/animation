import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:animation/constants.dart';
import 'package:animation/ui/login_page.dart';
import 'package:animation/ui/scan_page.dart';
import 'package:animation/ui/screens/cart_page.dart';
import 'package:animation/ui/screens/favorite_page.dart';
import 'package:animation/ui/screens/home_page.dart';
import 'package:animation/ui/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RootPage> {
  int _bottomNavIndex = 0;
  List<Widget> pages = const [
    HomePage(),
    FavoritePage(),
    CartPage(),
    ProfilePage(),
  ];

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> titleList = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                titleList[_bottomNavIndex],
                style: TextStyle(
                  color: Constants.blackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                color: Constants.blackColor,
                size: 30.0,
              ),
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.primaryColor,
        shape: CircleBorder(),
        elevation: 6.0,
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: const ScanPage(),
                  type: PageTransitionType.bottomToTop));
        },
        child: Image.asset(
          'assets/images/code-scan-two.png',
          height: 30.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Constants.primaryColor,
          activeColor: Constants.primaryColor,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
            });
          }),
    );
  }
}
