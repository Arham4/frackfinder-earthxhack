import 'package:flutter/material.dart';
import 'package:frackfinder/add_drone.dart';
import 'package:frackfinder/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(25),
          child: ListView(
            children: <Widget>[
              Container(
                height: 250,
                child: Image.asset("images/logo.png"),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Username'),
                onChanged: (String string) {},
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'OXY Employee ID'),
                onChanged: (String string) {},
              ),
              SizedBox(
                height: 40,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
                child: Text('Login'),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ));
  }
}
