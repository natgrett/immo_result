import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:immo_result/pageRouteGenerator.dart';
import 'package:immo_result/resultsListScreen.dart';

//1. First Screen

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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteGenerator(builder: (context) {
                      return ResultScreen();
                    }),
                  );
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'PageRouteGenerator',
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff00ffd0),
                  ),
                  width: 125.0,
                  height: 125.0,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(_createRoute());
              },
              child: Container(
                child: Center(
                  child: Text(
                    'fastOutSlowIn',
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff00ffd0),
                ),
                width: 125.0,
                height: 125.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ResultScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //using CurvedAnimation - Curves.fastOutSlowIn
      var sliderTransition3 = ScaleTransition(
        scale: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        child: child,
      );
      return sliderTransition3;
    },
  );
}

Route _createRoute1() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ResultScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      //Example0, using CurveTween
      var curveTween = CurveTween(curve: curve);
      var tween1 = Tween(begin: begin, end: end).chain(curveTween);
      var slideTransition0 = SlideTransition(
        position: animation.drive(tween1),
        child: child,
      );

      //Example1, using CurvedAnimation - Curves.ease;
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );
      var tween2 = Tween(begin: begin, end: end);
      var slideTransition1 = SlideTransition(
        position: tween2.animate(curvedAnimation),
        child: child,
      );

      return slideTransition1;
    },
  );
}

Route _createRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ResultScreen(),
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //Example2, using CurvedAnimation - Curves.fastOutSlowIn
      var sliderTransition3 = RotationTransition(
        turns: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.linear,
          ),
        ),
        child: child,
      );
      return sliderTransition3;
    },
  );
}

Route _createRoute3() {
  return PageRouteBuilder(
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) =>
        ResultScreen(),
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) =>
        Align(
      child: SizeTransition(
        sizeFactor: animation,
        child: child,
      ),
    ),
  );
}
