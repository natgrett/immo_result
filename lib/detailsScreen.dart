import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'immoObjects/house.dart';


//////////////////////////////////////////////////////3.Third Screen (Details) - Pilot Object//////////////////////////////

class DetailsScreen extends StatelessWidget {
  final House house;

  DetailsScreen(this.house);

  @override
  Widget build(BuildContext context) {
    final myImage = Hero(
      tag: house.houseId,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(house.houseImage),
          ),
        ),
      ),
    );

    final myDetails = Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(4.0),
      shadowColor: Colors.teal,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(
                          child: Icon(FontAwesomeIcons.dollarSign,
                            color: Color(0xFF00ffd0),
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(child: Text(house.housePrice,
                            style: TextStyle(
                                fontFamily: 'MakeItSans', color: Colors.black, fontSize: 22.0)),),
                      ),
                    ],)),
                ],)
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(
                          child: Icon(FontAwesomeIcons.map,
                            color: Color(0xFF00ffd0),
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(child: Text(house.houseAddress,
                            style: TextStyle(
                                fontFamily: 'MakeItSans', color: Colors.black, fontSize: 22.0)),),
                      ),
                    ],)),
                ],)
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Material(
                        color: Color(0xFF00ffd0),
                        shape: CircleBorder(),
                        child: Padding
                          (
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite_border,
                              color: Colors.white,
                              size: 35.0, ),
                        )
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),

      ),
    );


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(FontAwesomeIcons.arrowLeft,size: 17,
            color: Color(0xff333333),
          ), onPressed: () => Navigator.of(context).pop(),),
          actions: <Widget>[
          ],
        ),
        body: Column(
          children: <Widget>[
            myImage,
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
              child: myDetails,
            ),
          ],
        ),
      ),
    );
  }
}

/*
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
 */