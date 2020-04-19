import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'immoObjects/house.dart';


//////////////////////////////////////////////////////3.Third Screen (Details) - Pilot Object//////////////////////////////

class DetailsScreen extends StatelessWidget {
  final House house;

  DetailsScreen({this.house});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(fontFamily: 'MakeItSans', color: Colors.black),
        ),
        backgroundColor: Color(0xff66ffe3),
      ),
      body: Center(

        child: Image(
            image: AssetImage('assets/objects/5.png'), fit: BoxFit.fitWidth),

        /*Image(
            image: AssetImage('assets/objects/5.png'), fit: BoxFit.fitWidth),
            */
      ),
    );
  }
}
