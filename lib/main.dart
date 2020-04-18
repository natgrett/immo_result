import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:immo_result/main.dart';
import 'package:immo_result/resultsListScreen.dart';
import 'package:immo_result/searchScreen.dart';
import 'detailsScreen.dart';
import 'immoObjects/house.dart';
import 'immoObjects/houseDetails.dart';

void main(){
  runApp(immoApp());
}

class immoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ImmoScout24',
      theme: ThemeData(
        primaryColor: Color(0xff66ffe3),
      ),
      initialRoute: '/search',
      routes: {
        '/search': (context) => SearchScreen(),
        '/results': (context) => ResultsScreen(),
        '/details': (context) => DetailsScreen(),
      },
    );
  }

}

