import 'package:flutter/material.dart';
import 'package:tccflutter/pages/stars.dart';

Widget buildProfileUser(user, context, index, removeUser) {
  return Padding(padding: EdgeInsets.only(top: 10.0),
    child: Column(  
    children: <Widget>[
      CircleAvatar(
        radius: 70.0,
        backgroundImage: NetworkImage(user["avatar"]),
      ),
      Container(
        margin: EdgeInsets.only(top: 5.0),
        child:Text(user["name"], style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 16.0)),
      ),
      Container(
        margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
        child:Text(user["bio"], style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w200, fontSize: 12.0, color: Colors.grey[900])),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RaisedButton(
            color: Colors.deepPurple[900],
            onPressed: () => {
              Navigator.push(
                  context,
                MaterialPageRoute(
                  builder: (context) => StarsPage(
                        user: user,
                      ),
                ),
              )
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(Icons.people, color: Colors.white), 
                Text(" Ver Perfil", style: TextStyle(color: Colors.white)),
                ]
            ),
          ),
            RaisedButton(
            color: Colors.red,
            onPressed: () => removeUser(index),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(Icons.delete, color: Colors.white), 
                Text(" Remover", style: TextStyle(color: Colors.white)),
                ]
            ),
          ),
          
        ],
      ),
    ],
  ),
  );
}