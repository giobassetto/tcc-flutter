import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:loading/indicator/line_scale_indicator.dart';
import 'package:loading/loading.dart';
import '../components/star.dart';

class StarsPage extends StatefulWidget {
  final user;

  const StarsPage({Key key, this.user}): super(key: key);

  @override
  _StarsPageState createState() => _StarsPageState();
}

class _StarsPageState extends State<StarsPage> {
  var starreds = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

   getData() async {
    var login = widget.user["login"];
    http.Response response = await http.get("https://api.github.com/users/$login/starred");
    setState(() {
      starreds = jsonDecode(response.body);
    });
    print(starreds);
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple[900],
        title: Text(widget.user["name"]),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 35.0, right: 10.0, left: 10.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 450,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                  radius: 70.0,
                  backgroundImage: NetworkImage(widget.user["avatar"]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child:Text(widget.user["name"], style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 16.0)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
                  child:Text(widget.user["bio"], style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w200, fontSize: 12.0, color: Colors.grey[900])),
                ),
                ],
              ),
            ),

            Expanded(
                  child: SizedBox(
                    width: 390.00,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: starreds.length,
                      itemBuilder: (context, index) {
                        return buildStar(starreds[index]);
                      },
                    ),
                  ),
                )
          ],
        ) 
            
      ),
    );
  }
}