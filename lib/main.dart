import 'package:flutter/material.dart';
import 'package:immo_result/searchScreen.dart';

void main() {
  runApp(PrivateInvestorApp());
}

class PrivateInvestorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ImmoScout24',
      theme: ThemeData(
        primaryColor: Color(0xff66ffe3),
        fontFamily: 'MakeItSans',
      ),
      //darkTheme: ThemeData.dark(),
      home: SearchScreen(),
    );
  }
}
