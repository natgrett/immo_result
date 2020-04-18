import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'immoObjects/immoObjects.dart';

/////////////////////////////////////////////////////2. Second Screen - Results List//////////////////////////////

class ResultsScreen extends StatefulWidget {
  ResultsScreen({Key key}) : super(key: key);

  @override
  _ResultsScreenState createState() => new _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override

  //World Map - Pilot Object
  Widget worldMap = new Container(
    child: Image(
        image: AssetImage('assets/map/example2.png'),
        fit: BoxFit.fitWidth
    ),
    height: 175.0,
  );

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

  //

  Widget navigationWithoutCurve = new BottomNavigationBar(
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          elevation: 0.0,
          bottomOpacity: 10.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xff333333)),
            onPressed: () => Navigator.pop(context),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.swap_vert, color: Colors.black),
            )
          ],

          //title: Text('Results', style: TextStyle(fontFamily: 'MakeItSans', color: Colors.black),
          title: Container(
              margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(200, 240, 240, 240),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child:  TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "🔍  Adjust Search",
                        hintStyle: TextStyle(color: Color(0xff333333)),
                        //icon: Icon(Icons.search, color: Color(0xff333333)),
                      ),
                    ),

                  ),
                ],
              )),
        ),
      ),

      bottomNavigationBar: navigationWithoutCurve,
      //,,navigationBarWithCurves

      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 2.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ImmoObjects(),
          ),
        ],
      ),
    );
  }
}