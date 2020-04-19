import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavigationBarWithoutCurve extends StatelessWidget {

  Widget navigationBarWithoutCurve = new BottomNavigationBar(
    /*
    currentIndex: _selectedPage,
          onTap: (int index){
            setState((){
              _selectedPage = index;
            });
          },
     */
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Color(0xff333333)),
            title: Text(
              'Search',
              style: TextStyle(color: Colors.black),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Color(0xff00ffd0)),
            title: Text(
              'Saved',
              style: TextStyle(color: Colors.black),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_box, color: Color(0xff333333)),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.black),
            )),
      ]);

  @override
  Widget build(BuildContext context) {
    return navigationBarWithoutCurve;
  }
}

class NavigationBarWithCurve extends StatelessWidget {

  //CurvedNavigationBar
  Widget navigationBarWithCurves = new CurvedNavigationBar(
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