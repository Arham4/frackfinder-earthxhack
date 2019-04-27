import 'package:flutter/material.dart';
import 'package:frackfinder/page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Page(
      pageName: '/home',
      body: ListView(
        padding: EdgeInsets.all(25),
        children: <Widget>[
          ProfileWidget(
            Image.asset("images/dummy_profile_picture.jpg"),
            'Welcome Vicki!',
            MainAxisAlignment.spaceBetween,
          ),
          Text(
            "DummyText",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
