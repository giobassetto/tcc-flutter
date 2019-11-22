import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Benchmark extends StatefulWidget {
  @override
  _BenchmarkState createState() => _BenchmarkState();
}

class _BenchmarkState extends State<Benchmark> {
var time;
var array = [];

@override
void initState() {
  getData();
  super.initState();
}

getData() async {
  http.Response response = await http.get("https://firestore.googleapis.com/v1/projects/names-database-448b8/databases/(default)/documents/names/tcc/");
  final data = json.decode(response.body);
  array.addAll(data["fields"]["names"]["arrayValue"]["values"]);
}

initTest() async {
  var initial =  DateTime.now().millisecond;
  print(array.length);
  for(int j = 0; j < 100000; j++) {
    var a;
    for(int i = array.length; i-- > 0;){
      a = array[i]["stringValue"];
    }
    array.forEach((b){
      a = b["stringValue"];
    });
  }
  var timefinal = DateTime.now().millisecond;
  setState(() {
    time = timefinal - initial / 1000;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.deepPurple[900],
         title: Text("Benchmark"),
         centerTitle: true,
       ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: <Widget>[
          Center(child: Container(margin: EdgeInsets.only(top: 25.0, bottom: 40.0) , width: 350.0, height: 50.0,
            child: RaisedButton(
                      onPressed: () => initTest(),
                      color: Colors.deepPurple[900],
                      child: Text('Iniciar Teste', 
                                textAlign: TextAlign.center, 
                                style: TextStyle(color: Colors.white, fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold, fontSize: 18.0
                              ),
                  ),
                ),
            ),
           ),
           Center(
             child: Text(
                          "Tempo: $time segundos", 
                          textAlign: TextAlign.center, 
                          style: TextStyle(
                                            fontFamily: 'Roboto', 
                                            fontSize: 22.0, 
                                            fontWeight: FontWeight.bold
                                          ),
                        ),
           ),
         ],
       ),
    );
  }
}