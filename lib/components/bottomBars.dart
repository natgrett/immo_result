import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../pageRouteGenerator.dart';
import '../resultsListScreen.dart';
import '../searchScreen.dart';

class NavigationBarWithoutCurves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String pfofileIcon =
        'assets/icons/is24_system/is24_system_48px_profile.svg';
    final String searchIcon =
        'assets/icons/is24_system/is24_system_48px_search.svg';
    final String savedIcon =
        'assets/icons/is24_system/is24_system_48px_heart_favorite.svg';
    const TextStyle optionStyle =
        TextStyle(fontFamily: 'MakeItSans', color: Colors.black);

    final Widget navigationWithoutCurve = PreferredSize(
      preferredSize: Size.fromHeight(56.0),
      child: BottomNavigationBar(
        selectedFontSize: 12.0,
        unselectedFontSize: 10.0,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: 24.0,
                height: 24.0,
                child: SvgPicture.asset(
                  searchIcon,
                  semanticsLabel: 'Search Icon',
                ),
              ),
              activeIcon: Container(
                width: 24.0,
                height: 24.0,
                child: SvgPicture.asset(
                  searchIcon,
                  semanticsLabel: 'Search Icon',
                  color: Color(0xff00FFD0),
                ),
              ),
              title: Text(
                'Search',
                style: optionStyle,
              ),
            ),

          BottomNavigationBarItem(
              icon: Container(
                width: 23.0,
                height: 23.0,
                child: SvgPicture.asset(
                  savedIcon,
                  semanticsLabel: 'Saved Icon',
                ),
              ),
              activeIcon: Container(
                width: 23.0,
                height: 23.0,
                child: SvgPicture.asset(
                  searchIcon,
                  semanticsLabel: 'Search Icon',
                  color: Color(0xff00FFD0),
                ),
              ),
              title: Text(
                'Saved',
                style: optionStyle,
              )),
          BottomNavigationBarItem(
              icon: Container(
                width: 23.0,
                height: 23.0,
                child: SvgPicture.asset(
                  pfofileIcon,
                  semanticsLabel: 'Profile Icon',
                ),
              ),
              activeIcon: Container(
                width: 23.0,
                height: 23.0,
                child: SvgPicture.asset(
                  searchIcon,
                  semanticsLabel: 'Search Icon',
                  color: Color(0xff00FFD0),
                ),
              ),
              title: Text(
                'Profile',
                style: optionStyle,
              )),
        ],
      ),
    );

    return navigationWithoutCurve;
  }
}

class NavigationBarWithCurves extends StatelessWidget {
  final Widget navigationBarWithCurves = new CurvedNavigationBar(
    color: Colors.white,
    backgroundColor: Color(0xff00ffd0),
    buttonBackgroundColor: Color(0xff00ffd0),
    //Color(0xff00ffd0)
    height: 70,
    items: <Widget>[
      Icon(Icons.search, size: 20, color: Colors.black),
      Icon(Icons.favorite, size: 20, color: Colors.black),
      Icon(Icons.list, size: 20, color: Colors.black),
      Icon(Icons.account_box, size: 20, color: Colors.black),
    ],
    animationDuration: Duration(milliseconds: 200),
    animationCurve: Curves.bounceInOut,
    onTap: (index) {
      debugPrint("Current Index is $index");
    },
  );

  @override
  Widget build(BuildContext context) {
    return navigationBarWithCurves;
  }
}
