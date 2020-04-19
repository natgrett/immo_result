import 'package:flutter/material.dart';

class House {
  final houseId;
  final housePrice;
  final houseImage;
  final houseValue;
  final houseQuantity;
  final houseRentTrend;
  final housePriceTrend;
  final houseAddress;

  House(
    this.houseId,
    this.houseImage,
    this.housePrice,
    this.houseValue,
    this.houseQuantity,
    this.houseRentTrend,
    this.housePriceTrend,
    this.houseAddress,
  );
}

  final List<House> listOfHouses = [
    House("1","assets/objects/1.png", "680,000 €", "TEUER", "5,365 €/m2", "4.1%", "9.6%", "10627 Berlin, Wilmelsdorf"),
    House("2", "assets/objects/2.png", "100,800 €", "ETWAS TEUER", "6,325 €/m2","5.2%", "9.6%", "12169 Berlin, Steglitz"),
    House("3", "assets/objects/3.png", "560,000 €", "TEUER", "10,775 €/m2", "1.1%", "19.4%", "13777 Potsdam"),
    House("4", "assets/objects/4.png", "29,000 €", "ETWAS TEUER","666 €/m2", "3.4%", "10.6%", "12169 Berlin, Steglitz"),
    House("5", "assets/objects/5.png", "69,000 €", "TEUER", "10,555 €/m2","5.8%", "9.0%", "17843 Berlin, Teltow"),
    House("6", "assets/objects/6.png", "667,000 €", "ETWAS TEUER", "6,325 €/m2", "5.1%", "2.6%", "12169 Berlin, Steglitz"),

  ];

final List<House> listOfHousesPremium = [
  House("1","assets/premium_objects/1.png", "500,000 €", "TOP ANGEBOT", "5,365 €/m2", "3.1%", "1.6%", "10627 Berlin, Wilmelsdorf"),
  House("2", "assets/premium_objects/2.png", "899,999 €", "TOP ANGEBOT", "6,325 €/m2","5.2%", "4.6%", "12169 Berlin, Steglitz"),
  House("3", "assets/premium_objects/3.png", "560,000 €", "TOP ANGEBOT", "10,775 €/m2", "1.1%", "19.4%", "13777 Potsdam"),
  House("4", "assets/premium_objects/4.png", "999,999 €", "TOP ANGEBOT","3,666 €/m2", "3.4%", "10.6%", "12169 Berlin, Steglitz")

];


