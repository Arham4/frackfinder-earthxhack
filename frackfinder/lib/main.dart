import 'package:flutter/material.dart';
import 'package:frackfinder/pages/add_drone.dart';
import 'package:frackfinder/pages/home.dart';
import 'package:frackfinder/pages/login.dart';

void main() => runApp(FrackFinderApp());

class FrackFinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FrackFinder',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routes: {
        '/': (BuildContext context) => LoginPage(),
        '/home': (BuildContext context) => HomePage(),
        '/add_drone': (BuildContext context) => AddDronePage(),
      },
    );
  }
}
