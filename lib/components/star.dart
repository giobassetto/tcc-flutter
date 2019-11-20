import 'package:flutter/material.dart';

Widget buildStar(star) {
  return Padding(
    padding: EdgeInsets.only(top: 25.0),
    child: Container(
      color: Colors.grey[200],
      child: Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(star["owner"]["avatar_url"]),
          radius: 40.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 15.0),
          child: Column(
          children: <Widget>[
            Text(star["name"], style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold )),
            Text(star["owner"]["login"], style: TextStyle(color: Colors.grey[500], fontSize: 12.0, fontWeight: FontWeight.w300 )),
          ],
        )
        ),
      ],
    ),
    )
  );
}