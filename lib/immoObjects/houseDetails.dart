import 'package:flutter/material.dart';
import 'package:immo_result/immoObjects/house.dart';

class HauseDetails extends StatelessWidget {
  final House house;

  HauseDetails(this.house);

  @override
  Widget build(BuildContext context) {
    final myImage = Hero(
      tag: house.houseId,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(house.houseImage),
          ),
        ),
      ),
    );
  }
}
