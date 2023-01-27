import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map data;
  late List usersData;

  getUsers() async {
    http.Response response =
        await http.get(Uri.parse('http://10.0.2.2:4000/api/users'));
    data = json.decode(response.body);
    debugPrint(response.body);

    setState(() {
      usersData = data['users'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User list'),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView.builder(
        itemCount: usersData == null ? 0 : usersData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(usersData[index]['avatar']),
                ),
                Text("${usersData[index]["firstName"]}"),
                Text(" "),
                Text("${usersData[index]["lastName"]}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
