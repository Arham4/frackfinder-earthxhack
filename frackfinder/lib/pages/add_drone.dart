import 'package:flutter/material.dart';
import 'package:frackfinder/page.dart';

class AddDronePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Page(
      pageName: '/add_drone',
      body: Center(
        child: RaisedButton(
          child: Text("Begin Pairing"),
          onPressed: () {},
        ),
      ),
    );
  }
}
