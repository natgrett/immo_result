import 'package:flutter/material.dart';
import 'package:immo_result/main.dart';
import 'package:immo_result/searchScreen.dart';
import 'package:immo_result/resultsListScreen.dart';
import 'detailsScreen.dart';
import 'immoObjects/house.dart';

void main() {
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
      home: SearchScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }

  generateRoute(RouteSettings settings) {
    final path = settings.name.split('/');
    final houseId = path[1];


    House house =
        listOfHouses.firstWhere((myroute) => myroute.houseId == houseId);
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => DetailsScreen(house),
    );
  }
}
