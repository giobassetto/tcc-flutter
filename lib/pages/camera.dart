import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File imageFile;

  _openGalery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = picture;
    });

    Navigator.of(context).pop();
  }

  _openCamera() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Widget _renderImage() {
    if(imageFile == null) {
      return Text("Nenhuma imagem selecionada!");
    } else {
      return Image.file(imageFile, width: 300, height: 300);
    }
  }

  Future _showChoiceDialog(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Selecione:"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              RaisedButton(
                color: Colors.deepPurple[900],
                child: Text("Galeria", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold )),
                onPressed: () {
                  _openGalery();
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              RaisedButton(
                color: Colors.deepPurple[900],
                child: Text("Camera", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold )),
                onPressed: () {
                  _openCamera();
                },
              )
            ],
          ),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[900],
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _renderImage(),
          RaisedButton(
            child: Text("Selecione a imagem"),
            onPressed: (){
              _showChoiceDialog(context);
            },
          )
        ],
      ),
      )
    );
  }
}