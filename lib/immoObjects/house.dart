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
    House("1","assets/objects/1.png", "680,000 €", "TEUER", "6,325 €/m2", "4.1%", "9.6%", "12169 Berlin, Steglitz"),
    House("2", "assets/objects/2.png", "680,000 €", "ETWAS TEUER", "6,325 €/m2","4.1%", "9.6%", "12169 Berlin, Steglitz"),
    House("3", "assets/objects/3.png", "680,000 €", "TEUER", "6,325 €/m2", "4.1%", "9.6%", "12169 Berlin, Steglitz"),
    House("4", "assets/objects/4.png", "680,000 €", "ETWAS TEUER","6,325 €/m2", "4.1%", "9.6%", "12169 Berlin, Steglitz"),
    House("5", "assets/objects/5.png", "680,000 €", "TEUER", "6,325 €/m2","4.1%", "9.6%", "12169 Berlin, Steglitz"),
    House("6", "assets/objects/6.png", "680,000 €", "ETWAS TEUER", "6,325 €/m2", "4.1%", "9.6%", "12169 Berlin, Steglitz"),

  ];


