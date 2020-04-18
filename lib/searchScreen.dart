import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            Navigator.pushNamed(context, '/results');
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
