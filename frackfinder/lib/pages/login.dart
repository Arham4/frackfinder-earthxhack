import 'package:flutter/material.dart';

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
