import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:immo_result/resultsListScreen.dart';

import 'detailsScreen.dart';

///////////////////////////////////////////////////1. First Screen - Pilot Object//////////////////////////////

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ImmoScout24',
          style: TextStyle(fontFamily: 'MakeItSans', color: Colors.black),
        ),
        backgroundColor: Color(0xff66ffe3),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(_createRoute());
          },
          child: Container(
            child: Icon(
              Icons.search,
              size: 60.0,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff00ffd0),
            ),
            width: 100.0,
            height: 100.0,
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SearchSheet(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      //Example1, using CurveTween
      var curveTween = CurveTween(curve: curve);
      var tween1 = Tween(begin: begin, end: end).chain(curveTween);
      var slideTransition1 = SlideTransition(
        position: animation.drive(tween1),
        child: child,
      );

      //Example2, using CurvedAnimation
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );
      var tween2 = Tween(begin: begin, end: end);
      var slideTransition2 = SlideTransition(
        position: tween2.animate(curvedAnimation),
        child: child,
      );

      return slideTransition2;
    },
  );
}
