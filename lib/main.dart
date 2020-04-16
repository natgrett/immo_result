import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:immo_result/immoObjects/immoObjects.dart';


void main() => runApp(MaterialApp(
      theme: ThemeData(fontFamily: 'MakeItSans'),
      initialRoute: '/search',
      routes: {
        '/search': (context) => SearchScreen(),
        '/results': (context) => ResultsScreen(),
        '/details': (context) => DetailsScreen(),

      },
    ));

//1. First Screen - Pilot Object
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

//2. Second Screen - Results List
class ResultsScreen extends StatefulWidget {
  ResultsScreen({Key key}) : super(key: key);

  @override
  _ResultsScreenState createState() => new _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  //for navigationWithoutCurve
  int _selectedPage = 0;
  final _pageOptions = [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
    Text('Item 4'),
  ];

  //World Map - Pilot Object
  Widget worldMap = new Container(
    child: Image(
        image: AssetImage('assets/map/example.png'), fit: BoxFit.fitWidth),
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
              'Fav',
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
      backgroundColor: Color(0xffd6d6d6),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          elevation: 0.0,
          bottomOpacity: 10.0,
          backgroundColor: Color(0xff33ffd9),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xff333333)),
            onPressed: () => Navigator.pop(context),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: Colors.black),
            )
          ],

          //title: Text('Results', style: TextStyle(fontFamily: 'MakeItSans', color: Colors.black),
          title: Container(
              margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(120, 255, 255, 255),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Adjust Search",
                          hintStyle: TextStyle(color: Color(0xff333333)),
                          //icon: Icon(Icons.search, color: Color(0xff333333)),
                        ),
                      )),
                  /*Expanded(
                  flex: 0,
                  child: Row(
                    children: <Widget>[
                      */ /*IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.mic, color: Color(0xff333333)),
                      ),*/ /*
                      VerticalDivider(color: Color(0xff333333)),
                    ],
                  )
                )*/
                ],
              )),
        ),
      ),

      bottomNavigationBar: navigationWithoutCurve,
      //navigationWithoutCurve


      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          worldMap,
          Container(
            height: (MediaQuery.of(context).size.height / 1.7),
            width: MediaQuery.of(context).size.width,
            child: ImmoObjects(),
          ),
        ],
      ),
    );
  }
}

//3.Third Screen (Details) - Pilot Object
class DetailsScreen extends StatelessWidget {
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
      ),
    );
  }
}
