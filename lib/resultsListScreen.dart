import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bars/bottomBars.dart';
import 'immoObjects/house.dart';

class SearchSheet extends StatelessWidget {



  @override
  Widget build(BuildContext context) {


    createHouseImage(House house) => Hero(
          tag: house.houseId,
          child: Column(
            children: <Widget>[
              Material(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, 'housedetails/${house.houseId}');
                  },
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        //Picture of House in ResultsList
                        Container(
                          width: 100,
                          height: 80,
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: AssetImage(house.houseImage),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                        //Text about House in ResultList
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Text(house.housePrice,
                                style: TextStyle(
                                    color: Color(0xFFED1D7F), fontSize: 18.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

    final HouseGrid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.only(top: 8.0),
          sliver: SliverGrid.count(
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: 2.0,
            children:
                listOfHouses.map((house) => createHouseImage(house)).toList(),
          ),
        ),
      ],
    );

    creteDetailsBottom (House house) => new ListTile(
        contentPadding: EdgeInsets.symmetric(
            vertical: 0.0, horizontal: 20.0),
        dense: true,
        title: new Text.rich(TextSpan(
            text: '${house.housePrice}    ',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                text: house.houseQuantity,
                style: TextStyle(
                    fontSize: 13, color: Color(0xff5c5c5c)),
              ),
            ])),
        subtitle: Text(
          house.houseAddress,
        ),

        trailing: Wrap(
          spacing: 12, // space between two icons
          children: <Widget>[
            Text(
              house.houseValue,
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ), // icon-1
            Icon(
              Icons.favorite_border,
            ), // icon-2
          ],
        ),
        onTap: () {},
      );


    //HERE Your Design With HALF SIZE Photo of Hause
    HauseListHalfSize(House house) => Hero(
          tag: house.houseId,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              //padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Material(//test
                color: Colors.white,
                elevation: 5.0,
                borderRadius: BorderRadius.circular(3.0),
                shadowColor: Colors.teal,
                child: Column(
                  children: <Widget>[
                    Padding(
                      //padding: const EdgeInsets.all(10.0),
                      padding: EdgeInsets.symmetric(horizontal: 0.0),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 200,
                            decoration: new BoxDecoration(
                              image: new DecorationImage(
                                image: AssetImage(house.houseImage),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, 'housedetails/${house.houseId}');
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3.4,
                            height: 200.0,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(house.housePriceTrend,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 24.0)),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Price Trend',
                                        style: TextStyle(
                                            color: Color(0xff5c5c5c), fontSize: 14.0)),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(house.houseRentTrend,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 24.0)),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Rent Trend',
                                        style: TextStyle(
                                            color: Color(0xff5c5c5c), fontSize: 14.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: creteDetailsBottom(house),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );

    //HERE Design With FULL SIZE Photo of House
    HousesList(House house) => Hero(
          tag: house.houseId,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.white,
                elevation: 5.0,
                borderRadius: BorderRadius.circular(3.0),
                shadowColor: Colors.teal,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: AssetImage(house.houseImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, 'housedetails/${house.houseId}');
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: creteDetailsBottom(house),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
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
            bottom: TabBar(
              indicatorColor: Color(0xff00ffd0),
              tabs: [
                Tab(
                  child: Text('ALL',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'MakeItSans', color: Colors.black)),
                ),
                Tab(
                  child: Text('PREMIUM',

                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'MakeItSans', color: Colors.black,)),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: listOfHouses
                      .map((house) => HauseListHalfSize(house))
                      .toList(), // HauseListHalfSize OR HousesList
                ),
              ),
              Container(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: listOfHousesPremium
                      .map((house) => HauseListHalfSize(house))
                      .toList(), // HauseListHalfSize OR HousesList
                ),
              ),
            ],
          ),
          bottomNavigationBar: NavigationBarWithoutCurves(),
        ),
      ),
    );
  }
}



