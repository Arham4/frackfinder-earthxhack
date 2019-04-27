import 'package:flutter/material.dart';
import 'package:frackfinder/page.dart';

class LivestreamsPage extends StatelessWidget {
  static const int _droneCount = 5;

  @override
  Widget build(BuildContext context) {
    return Page(
      pageName: '/livestreams',
      body: ListView.builder(
        itemCount: _droneCount + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Center(
              child: Column(
                children: <Widget>[
                  Text(
                    "Livestreams",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            );
          }
          return InkWell(
            onTap: () => Navigator.pushNamed(context, '/livestream/$index'),
            child: Card(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 300,
                    child: Image.asset('images/dummy_drone_view.jpg'),
                  ),
                  Text(
                    'Drone $index',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class LivestreamPage extends StatefulWidget {
  final int id;

  LivestreamPage({this.id});

  @override
  State<StatefulWidget> createState() {
    return LivestreamPageState(id: id);
  }
}

class LivestreamPageState extends State<LivestreamPage> {
  final int id;

  LivestreamPageState({this.id});

  @override
  Widget build(BuildContext context) {
    return Page(
      pageName: '/livestream/$id',
      body: Center(
        child: Text('Hello from drone $id'),
      ),
    );
  }
}
