import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immo_result/components/title.dart';
import 'package:immo_result/realEstateObjects/house.dart';
import '../viewStates.dart';

//'asset/icons/is24_system/is24_system_48px_heart_favorite.svg'

//Main Structure of HouseBanner in helpImages/classHouseBanner.png

class HouseBanner extends StatelessWidget {
  final House house;
  final Function(House) onSelected;

  const HouseBanner({
    Key key,
    this.house,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String heartIcon =
        'assets/icons/is24_system/is24_system_48px_heart_favorite.svg';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.white,
        elevation: 6.0,
        borderRadius: BorderRadius.circular(3.0),
        shadowColor: Colors.teal,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 7.0, top: 7.0),
              child: Row(
                //1
                children: <Widget>[
                  GestureDetector(
                    //1.1
                    onTap: () {
                      if (onSelected != null) {
                        onSelected(house);
                      }
                    },
                    child: Hero(
                      tag: '${house.houseId}-img',
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.4,
                        height: 200,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: AssetImage(house.imgAssetsPath[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    //1.2
                    width: MediaQuery.of(context).size.width / 4.5,
                    height: 200.0,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          //1.2.1
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(house.housePriceTrend,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20.0)),
                          ),
                        ),
                        Container(
                          //1.2.2
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Price Trend',
                                style: TextStyle(
                                    color: Color(0xff5c5c5c), fontSize: 11.0)),
                          ),
                        ),
                        Container(
                          //1.2.3
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(house.houseRentTrend,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20.0)),
                          ),
                        ),
                        Container(
                          //1.2.4
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Rent Trend',
                                style: TextStyle(
                                    color: Color(0xff5c5c5c), fontSize: 11.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              //2
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  // 2.1
                  width: MediaQuery.of(context).size.width / 3 - 15,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Hero(
                    tag: '${house.houseId}-price',
                    flightShuttleBuilder: (
                      BuildContext flightContext,
                      Animation<double> animation,
                      HeroFlightDirection flightDirection,
                      BuildContext fromHeroContext,
                      BuildContext toHeroContext,
                    ) {
                      return DestinationTitle(
                        title: house.housePrice,
                        isOverflow: true,
                        viewState: flightDirection == HeroFlightDirection.push
                            ? ViewState.enlarge
                            : ViewState.shrink,
                        smallFontSize: 18.0,
                        largeFontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      );
                    },
                    child: DestinationTitle(
                      title: house.housePrice,
                      viewState: ViewState.shrunk,
                      smallFontSize: 18.0,
                      largeFontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  //2.2
                  width: MediaQuery.of(context).size.width / 3 - 15,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Hero(
                    tag: '${house.houseId}-quantity',
                    flightShuttleBuilder: (
                      BuildContext flightContext,
                      Animation<double> animation,
                      HeroFlightDirection flightDirection,
                      BuildContext fromHeroContext,
                      BuildContext toHeroContext,
                    ) {
                      return DestinationTitle(
                        title: house.houseQuantity,
                        isOverflow: true,
                        viewState: flightDirection == HeroFlightDirection.push
                            ? ViewState.enlarge
                            : ViewState.shrink,
                        smallFontSize: 15.0,
                        largeFontSize: 18.0,
                      );
                    },
                    child: DestinationTitle(
                      title: house.houseQuantity,
                      viewState: ViewState.shrunk,
                      smallFontSize: 15.0,
                      largeFontSize: 18.0,
                    ),
                  ),
                ),
                Container(
                  //2.3
                  width: MediaQuery.of(context).size.width / 3 - 15,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Wrap(
                    children: <Widget>[
                      Hero(
                        tag: '${house.houseId}-value',
                        flightShuttleBuilder: (
                          BuildContext flightContext,
                          Animation<double> animation,
                          HeroFlightDirection flightDirection,
                          BuildContext fromHeroContext,
                          BuildContext toHeroContext,
                        ) {
                          return DestinationTitle(
                            title: house.houseValue,
                            isOverflow: true,
                            viewState:
                                flightDirection == HeroFlightDirection.push
                                    ? ViewState.enlarge
                                    : ViewState.shrink,
                            smallFontSize: 15.0,
                            largeFontSize: 18.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          );
                        },
                        child: DestinationTitle(
                          title: house.houseValue,
                          viewState: ViewState.shrunk,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          smallFontSize: 15.0,
                          largeFontSize: 18.0,
                        ),
                      ),
                      Padding(
                        //2.4
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Container(
                          width: 23.0,
                          height: 23.0,
                          child: Center(
                            child: SvgPicture.asset(
                              heartIcon,
                              semanticsLabel: 'Heart Icon',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              //3
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 0.0, bottom: 8.0),
                    child: Container(
                      child: Hero(
                        tag: '${house.houseId}-address',
                        flightShuttleBuilder: (
                          BuildContext flightContext,
                          Animation<double> animation,
                          HeroFlightDirection flightDirection,
                          BuildContext fromHeroContext,
                          BuildContext toHeroContext,
                        ) {
                          return DestinationTitle(
                            title: house.houseAddress,
                            isOverflow: true,
                            viewState:
                                flightDirection == HeroFlightDirection.push
                                    ? ViewState.enlarge
                                    : ViewState.shrink,
                            smallFontSize: 15.0,
                            largeFontSize: 18.0,
                            color: Color(0xff5c5c5c),
                            fontStyle: FontStyle.italic,
                          );
                        },
                        child: DestinationTitle(
                          title: house.houseAddress,
                          viewState: ViewState.shrunk,
                          smallFontSize: 15.0,
                          largeFontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
