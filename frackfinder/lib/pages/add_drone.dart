import 'package:flutter/material.dart';
import 'package:frackfinder/page.dart';

class AddDronePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Page(
      pageName: '/add_drone',
      body: ListView(
        padding: EdgeInsets.only(
          left: 25,
          right: 25,
          top: 10,
        ),
        children: <Widget>[
          Center(
            child: Text(
              "Add Drone",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Drone Name'),
            onChanged: (String string) {},
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Drone ID'),
            onChanged: (String string) {},
          ),
          SizedBox(
            height: 40,
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text('Pair Drone', style: TextStyle(color: Colors.white),),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
