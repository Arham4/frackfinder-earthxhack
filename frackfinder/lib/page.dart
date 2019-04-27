import 'package:flutter/material.dart';

class Page extends StatefulWidget {
  final Widget body;
  final String pageName;

  Page({this.pageName, this.body});

  @override
  State<StatefulWidget> createState() {
    return _PageState(pageName, body);
  }
}

class _PageState extends State<Page> {
  final String pageName;
  final Widget body;

  _PageState(this.pageName, this.body);

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
      body: body,
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
                Icons.home,
                color: Theme.of(context).primaryColor,
              ),
              title: Text('Home'),
              onTap: () => _navigateToNamed('/home'),
            ),
            ListTile(
              leading: Icon(
                Icons.videocam,
                color: Theme.of(context).primaryColor,
              ),
              title: Text('Livestreams'),
              onTap: () => _navigateToNamed('/livestreams'),
            ),
            ListTile(
              leading: Icon(
                Icons.library_books,
                color: Theme.of(context).primaryColor,
              ),
              title: Text('Site Library'),
              onTap: () => _navigateToNamed('/library'),
            ),
            ListTile(
              leading: Icon(
                Icons.library_add,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("Add Drone"),
              onTap: () => _navigateToNamed('/add_drone'),
            )
          ],
        );
      },
    );
  }

  void _navigateToNamed(String name) {
    Navigator.pop(context);
    if (pageName != name) {
      Navigator.pushReplacementNamed(context, name);
    }
  }
}

class ProfileWidget extends StatelessWidget {
  final String text;
  final Image image;
  final MainAxisAlignment axisAlignment;
  final Widget fillerWidget;

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
