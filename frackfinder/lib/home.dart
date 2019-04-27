import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class ProfileWidget extends StatelessWidget {
  String text;
  Image image;
  MainAxisAlignment axisAlignment;
  Widget fillerWidget;

  ProfileWidget(this.image, this.text, this.axisAlignment, {this.fillerWidget});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: axisAlignment,
            children: <Widget>[
              Container(
                width: 75,
                height: 75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: image,
                ),
              ),
              fillerWidget != null ? fillerWidget : SizedBox(),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              )
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Image.asset('images/logo_text.png'),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: _showMenu,
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
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

  void _showMenu() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ProfileWidget(
              Image.asset("images/dummy_profile_picture.jpg"),
              'Vicki',
              MainAxisAlignment.start,
              fillerWidget: SizedBox(
                width: 10,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Theme.of(context).primaryColor,
              ),
              title: Text('Profile'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(
                Icons.videocam,
                color: Theme.of(context).primaryColor,
              ),
              title: Text('Livestreams'),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, '/livestreams'),
            ),
            ListTile(
              leading: Icon(
                Icons.library_books,
                color: Theme.of(context).primaryColor,
              ),
              title: Text('Site Library'),
              onTap: () => Navigator.pushReplacementNamed(context, '/library'),
            ),
            ListTile(
              leading: Icon(
                Icons.library_add,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("Add Drone"),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, '/add_drone'),
            )
          ],
        );
      },
    );
  }
}
