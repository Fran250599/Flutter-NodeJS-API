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
        await http.get(Uri.parse('http://10.0.2.2:4000 /api/users'));
    data = json.decode(response.body);

    setState(() {
      usersData = data['users'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String url = Platform.isAndroid
        ? 'http://192.168.178.23:3006'
        : 'http://localhost:3006';

    getUsers();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User list'),
        backgroundColor: Colors.lightGreen,
      ),
      //body:
      //ListView.builder(itemCount: usersData == null ? 0 : usersData.length),
    );
  }
}
