import 'package:flutter/material.dart';
import 'package:immo_result/pageRouteGenerator.dart';
import 'package:immo_result/realEstateObjects/house.dart';
import 'components/bottomBars.dart';
import 'components/houseBanner.dart';
import 'detailsScreen.dart';


//2. Second Screen
class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  bool returnFromDetailPage = false;
  ValueNotifier<bool> stateNotifier;

  @override
  void initState() {
    super.initState();
    _initAnimationController();
  }

  void _initAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    )..addListener(() {
        setState(() {});
      });

    stateNotifier = ValueNotifier(returnFromDetailPage)
      ..addListener(() {
        if (stateNotifier.value) {
          _animationController.reverse(from: 1.0);
          stateNotifier.value = false;
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    stateNotifier.dispose();
    super.dispose();
  }

  List<Widget> _buildDestinationBanners() {
    return listOfHouses.map((house) {
      return HouseBanner(
        house: house,
        onSelected: onSelected,
      );
    }).toList();
  }


  void onSelected(House house) async {
    _animationController.forward(from: 0.0);
    stateNotifier.value = await Navigator.of(context).push(
      PageRouteGenerator(
          //fullscreenDialog: true,
          builder: (context) {
            return DetailsScreen(
              housesList: listOfHouses,
              selectedIndex: listOfHouses.indexOf(house),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {

    final appBarWithSearchField = AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Color(0xff333333)),
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: Colors.white,
      title: Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
          decoration: BoxDecoration(
            color: Color(0xffccfff6),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                    hintText: "🔍  Adjust Search",
                    hintStyle: TextStyle(color: Color(0xff333333)),
                    //icon: Icon(Icons.search, color: Color(0xff333333)),
                  ),
                ),
              ),
            ],
          )),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.swap_vert, color: Colors.black),
            onPressed: () {
              //
            }),
      ],
    );

    return Scaffold(
      appBar: appBarWithSearchField,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 24.0,
            ),
          ),
          Column(
            children: _buildDestinationBanners(),
          )
        ],
      ),
      bottomNavigationBar: NavigationBarWithoutCurves(),
    );
  }
}


