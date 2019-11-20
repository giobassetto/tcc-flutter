import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading/indicator/line_scale_indicator.dart';
import 'package:loading/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../components/Profile.dart';

class MainGit extends StatefulWidget {
  @override
  _MainGitState createState() => _MainGitState();
}

class _MainGitState extends State<MainGit> {
  final nameController = TextEditingController();
  var users = [];
  bool isLoading = false;

  @override
  void initState() {
    getUsers();
    super.initState();
  }

getUsers() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var result = prefs.getString('@users');
  if(result != null) {
    setState(() {
      users = json.decode(result);
    });
  }
}

getData(name) async {
  http.Response response = await http.get("https://api.github.com/users/$name");
  return json.decode(response.body);
}

handleUser() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    isLoading = true;
  });
  final response = await this.getData(this.nameController.text);

  var user = {
    "name": response["name"],
    "login": response["login"],
    "bio": response["bio"],
    "avatar": response["avatar_url"]
  };
  this.nameController.clear();
  setState(() {
    users.add(user);
    isLoading = false;
    prefs.setString('@users', json.encode(users));
  });
}

void removeUser(index) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
   setState(() {
      users.removeAt(index);
      prefs.setString('@users', json.encode(users));
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[900],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30.0),
            child: Row(children: <Widget>[
              Container(
                width: 240.0,
                height: 48.0,
                color: Colors.grey[200],
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
                    ),
                    hintText: 'Seu usuário do GitHub',
                  ),
                ),
              ),
              Container(
                width: 60.0,
                height: 42.0,
                margin: EdgeInsets.only(left: 15.0),
                child: Center(
                  child: RaisedButton(
                      onPressed: this.handleUser,
                      color: Colors.deepPurple[900],
                      child: Center(
                        child: this.isLoading ? Loading(indicator: LineScaleIndicator(), size: 30.0) : Icon(Icons.add, color: Colors.white, size: 30.0),
                      ),
                ),
                
                ),
              ),
            ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 300.00,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return buildProfileUser(users[index], context, index, this.removeUser);
                },
              ),
            ),
          )
            
        ],
      ),
    );
  }
}

