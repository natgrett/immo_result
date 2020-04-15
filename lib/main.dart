import 'package:flutter/material.dart';
import 'package:immo_result/immoObjects/immoObjects.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(fontFamily: 'MakeItSans'),
  initialRoute: '/search',
  routes: {
    '/search' : (context) => SearchScreen(),
    '/results' : (context) => ResultsScreen(),
  },
));

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImmoScout24', style: TextStyle(fontFamily: 'MakeItSans', color: Colors.black),),
        backgroundColor: Color(0xff66ffe3),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/results');
          },
          child: Container (
            child: Icon(Icons.search, size: 60.0, color: Colors.white,),
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



class ResultsScreen extends StatefulWidget {
  ResultsScreen({Key key}) : super(key: key);

  @override
  _ResultsScreenState createState() => new _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget worldMap = new Container(
    height: 175.0,
    color: Colors.green,

  );
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff333333)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Results', style: TextStyle(fontFamily: 'MakeItSans', color: Colors.black),),
      ),

      body: ListView(
        children: <Widget>[
          SizedBox(height: 5.0,),

          worldMap,

          Container(
            height: 400,
            //child: ImmoObjects(),
          )


        ],
      ),


    );
  }

}
