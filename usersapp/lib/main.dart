import 'package:flutter/material.dart';
import 'package:http/http.dart';
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
  getUsers() {}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User list'),
        backgroundColor: Colors.lightGreen,
      ),
      //body: ListView.builder(),
    );
  }
}
