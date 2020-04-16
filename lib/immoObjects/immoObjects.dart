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
    {"id": "6",
      "price": "",
      "image":"assets/map/example2.png",
      "value": "",
      "quantity": "",
      "rentTrend": "",
      "priceTrend": "",
      "prodAddress": "",
    },
    {
      "id": "1",
      "price": "965,000 €",
      "image": "assets/objects/2.png",
      "value": "GUTES ANGEBOT",
      "quantity": "6,325 €/m2 ",
      "rentTrend": "4.1%",
      "priceTrend": "9.6%",
      "prodAddress": "12169 Berlin, Steglitz",
    },
    {
      "id": "2",
      "price": "345,788 €",
      "image": "assets/objects/3.png",
      "value": "TEUER",
      "quantity": "6,325 €/m2 ",
      "rentTrend": "4.1%",
      "priceTrend": "9.6%",
      "prodAddress": "12169 Berlin, Steglitz",
    },
    {
      "id": "3",
      "price": "324,086 €",
      "image": "assets/objects/4.png",
      "value": "ETWAS TEUER",
      "quantity": "6,325 €/m2 ",
      "rentTrend": "4.1%",
      "priceTrend": "9.6%",
      "prodAddress": "12169 Berlin, Steglitz",
    },
    {
      "id": "4",
      "price": "399,449 €",
      "image": "assets/objects/5.png",
      "value": "FAIRES ANGEBOT",
      "quantity": "6,325 €/m2 ",
      "rentTrend": "4.1%",
      "priceTrend": "9.6%",
      "prodAddress": "12169 Berlin, Steglitz",
    },
    {
      "id": "5",
      "price": "498,990 €",
      "image": "assets/objects/6.png",
      "value": "teuer",
      "quantity": "6,325 €/m2 ",
      "rentTrend": "4.1%",
      "priceTrend": "9.6%",
      "prodAddress": "12169 Berlin, Steglitz",
    },
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
            prodId: productList[index]['id'],
            prodPrice: productList[index]['price'],
            prodValue: productList[index]['value'],
            prodImage: productList[index]['image'],
            prodQuantity: productList[index]['quantity'],
            prodRentTrend: productList[index]['rentTrend'],
            prodPriceTrend: productList[index]['priceTrend'],
            prodAddress: productList[index]['prodAddress']);
      },
    );
  }
}

class SingleObject extends StatelessWidget {
  final prodId;
  final prodPrice;
  final prodImage;
  final prodValue;
  final prodQuantity;
  final prodRentTrend;
  final prodPriceTrend;
  final prodAddress;

  SingleObject({
    this.prodId,
    this.prodImage,
    this.prodPrice,
    this.prodValue,
    this.prodQuantity,
    this.prodRentTrend,
    this.prodPriceTrend,
    this.prodAddress,
  });

  //World Map - Pilot Object
  Widget worldMap = new Container(
    child: Image(
        image: AssetImage('assets/map/example2.png'), fit: BoxFit.fitWidth),
    height: 175.0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: prodId,
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
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                    dense: true,
                    title: new Text.rich(TextSpan(
                        text: '$prodPrice                   ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: prodQuantity,
                            style: TextStyle(
                                fontSize: 13, color: Color(0xff5c5c5c)),
                          ),
                        ])),
                    subtitle: Text(
                      prodAddress,
                    ),

                    trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        Text(
                          prodValue,
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
                  ),
                ),
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
