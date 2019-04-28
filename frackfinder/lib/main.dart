import 'package:flutter/material.dart';
import 'package:frackfinder/pages/add_drone.dart';
import 'package:frackfinder/pages/livestreams.dart';
import 'package:frackfinder/pages/login.dart';
import 'package:frackfinder/pages/site_library.dart';

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
        '/add_drone': (BuildContext context) => AddDronePage(),
        '/livestreams': (BuildContext context) => LivestreamsPage(),
        '/site_library': (BuildContext context) => SiteLibraryPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        } else if (pathElements[1] == 'livestream') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => LivestreamPage(id: index),
          );
        } else if (pathElements[1] == 'site') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => SitePage(index),
          );
        }
        return null;
      },
    );
  }
}