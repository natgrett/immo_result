import 'dart:core';

class House {
  final String houseId;
  final String housePrice;
  final String houseValue;
  final List<String> imgAssetsPath;
  final houseQuantity;
  final houseRentTrend;
  final housePriceTrend;
  final houseAddress;

  House({
    this.houseId,
    this.housePrice,
    this.houseValue,
    this.imgAssetsPath,
    this.houseQuantity,
    this.houseRentTrend,
    this.housePriceTrend,
    this.houseAddress,
  });
}

final List<House> listOfHouses = [
  House(
    houseId: '1',
    housePrice: '680,000 €',
    houseValue: 'TEUER',
    imgAssetsPath: ['assets/objects/1.png', 'assets/objects/2.png'],
    houseQuantity: "5,365 €/m2",
    houseRentTrend: "4.1%",
    housePriceTrend: "9.6%",
    houseAddress: "10627 Berlin, Wilmelsdorf",
  ),
  House(
    houseId: '2',
    housePrice: '100,800 €',
    houseValue: 'TEUER',
    imgAssetsPath: ['assets/objects/2.png'],
    houseQuantity: "5,365 €/m2",
    houseRentTrend: "4.1%",
    housePriceTrend: "9.6%",
    houseAddress: "14555 Berlin, Steglitz",
  ),
  House(
    houseId: '3',
    housePrice: '560,000 €',
    houseValue: 'TEUER',
    imgAssetsPath: ['assets/objects/3.png'],
    houseQuantity: "5,365 €/m2",
    houseRentTrend: "4.1%",
    housePriceTrend: "9.6%",
    houseAddress: "17000 Potsdam, Potsdam",
  ),
  House(
    houseId: '4',
    housePrice: '29,000 €',
    houseValue: 'TEUER',
    imgAssetsPath: ['assets/objects/4.png'],
    houseQuantity: "5,365 €/m2",
    houseRentTrend: "4.1%",
    housePriceTrend: "9.6%",
    houseAddress: "14333 Berlin, Teltow",
  ),
  House(
    houseId: '5',
    housePrice: '150,000 €',
    houseValue: 'TEUER',
    imgAssetsPath: ['assets/objects/5.png'],
    houseQuantity: "5,365 €/m2",
    houseRentTrend: "4.1%",
    housePriceTrend: "9.6%",
    houseAddress: "10600 Berlin, Grünewald",
  ),
  House(
    houseId: '6',
    housePrice: '467,000 €',
    houseValue: 'TEUER',
    imgAssetsPath: ['assets/objects/6.png'],
    houseQuantity: "5,365 €/m2",
    houseRentTrend: "4.1%",
    housePriceTrend: "9.6%",
    houseAddress: "13627 Berlin, Steglitz",
  ),
];

