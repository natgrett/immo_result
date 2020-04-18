import 'package:flutter/material.dart';

class ListOfHouses extends StatelessWidget {
  ListOfHouses();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 1,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250.0,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(
                    "https://images.unsplash.com/photo-1434082033009-b81d41d32e1c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
