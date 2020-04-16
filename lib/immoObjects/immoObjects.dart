import 'package:flutter/material.dart';

class ImmoObjects extends StatefulWidget {
  ImmoObjects({Key key}) : super(key: key);

  @override
  _ImmoObjectsState createState() => _ImmoObjectsState();
}

class _ImmoObjectsState extends State<ImmoObjects> {
  var productList = [
    /*{
      "image" : "assets/objects/1.png",
      //first line
      "price" : "680,000 €",
      "quantity" : "6,325 €/m ",
      //second line
      "netYeld" : "2.2%",
      "rentTrend" : "4.1%",
      "priceTrend" : "9.6%",
      //right side
      "value" : "etwas teuer",
      //not represented
      "expRent" : "1,950 €",
      "rentFactor" : "35",
      "name" : "1"
    },

     */
    {"name": "965,000 €", "image": "assets/objects/2.png", "value": "teuer"},
    {"name": "345,788 €", "image": "assets/objects/3.png", "value": "teuer"},
    {"name": "324,086 €", "image": "assets/objects/4.png", "value": "teuer"},
    {"name": "399,449 €", "image": "assets/objects/5.png", "value": "teuer"},
    {"name": "498,990 €", "image": "assets/objects/6.png", "value": "teuer"},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 2.5),
      ),
      itemBuilder: (BuildContext context, int index) {
        return SingleObject(
          prodName: productList[index]['name'],
          prodValue: productList[index]['value'],
          prodImage: productList[index]['image'],
        );
      },
    );
  }
}

class SingleObject extends StatelessWidget {
  final prodName;
  final prodImage;
  final prodValue;

  SingleObject({this.prodImage, this.prodName, this.prodValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: prodName,
        child: Material(
          child: InkWell(
              onTap: () {},
              child: GridTile(
                footer: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: ListTile(
                      //Card https://flutter.dev/docs/development/ui/layout#gridview
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                      dense: true,
                      leading: new Text(
                        prodName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        prodValue,
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),

                      subtitle: Text('3,642 €/m²'),
                    )),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/details');
                  },
                  child: Image.asset(prodImage, fit: BoxFit.fitWidth),
                ),
              )),
        ),
      ),
    );
  }
}

