import 'package:flutter/material.dart';
import 'package:tccflutter/pages/benchmark.dart';
import './maingit.dart';
import './camera.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Comparativo entre Frameworks'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple[900],
      ),
      body: Column(
        children: <Widget>[
          Container(margin: EdgeInsets.only(top: 25.0), child: Row(children: <Widget>[
                Padding(child: Image.asset('images/flutter2.png', width: 82.0, height: 82.0,), padding: EdgeInsets.all(20.0)),
                Padding(child: Image.asset('images/react-native.png', width: 82.0, height: 82.0,), padding: EdgeInsets.all(20.0)),
                Padding(child: Image.asset('images/xamarin.jpg', width: 82.0, height: 82.0,), padding: EdgeInsets.all(20.0)),
              ],
            )
          ), 
          Container(margin: EdgeInsets.only(top: 80.0) , width: 350.0, height: 50.0, 
          child: RaisedButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainGit()),
                      )
                    },
                    color: Colors.deepPurple[900],
                    child: Text('Consultar API - GitHub', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(color: Colors.white, fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold, fontSize: 18.0
                  ),
                ),
              ),
            ),

          Container(margin: EdgeInsets.only(top: 60.0) , width: 350.0, height: 50.0,
          child: RaisedButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CameraPage()),
                      )
                    },
                    color: Colors.deepPurple[900],
                    child: Text('Tirar uma Foto', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(color: Colors.white, fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold, fontSize: 18.0,
                  ),
                ),
              ),
            ),

          Container(margin: EdgeInsets.only(top: 60.0) , width: 350.0, height: 50.0,
          child: RaisedButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Benchmark()),
                      )
                    },
                    color: Colors.deepPurple[900],
                    child: Text('Teste de Benchmark', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(color: Colors.white, fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold, fontSize: 18.0,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}