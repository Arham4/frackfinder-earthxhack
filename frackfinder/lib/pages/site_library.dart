import 'package:flutter/material.dart';
import 'package:frackfinder/page.dart';

List<Map<String, int>> scores = [
  {'water': 0, 'geographic': 3, 'experience': 3, 'average': 2},
  {'water': 1, 'geographic': 7, 'experience': 7, 'average': 5},
  {'water': 5, 'geographic': 2, 'experience': 2, 'average': 3},
  {'water': 10, 'geographic': 9, 'experience': 8, 'average': 9},
];

class SiteLibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Page(
      pageName: '/site_library',
      body: ListView.builder(
        itemCount: scores.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Center(
              child: Column(
                children: <Widget>[
                  Text(
                    "Site Library",
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
          if (index == 1) {
            index = 4;
          } else if (index == 4) {
            index = 1;
          }
          return InkWell(
            onTap: () => Navigator.pushNamed(context, '/site/$index'),
            child: Card(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.star),
                          Text(
                            '${scores[index - 1]['average']}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        height: 150,
                        child: Image.asset('images/site_$index.jpg'),
                      ),
                    ],
                  ),
                  Text(
                    'Site $index',
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

class SitePage extends StatelessWidget {
  final int id;

  SitePage(this.id);

  @override
  Widget build(BuildContext context) {
    return Page(
      pageName: '/site/$id',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 250,
              width: double.infinity,
              child: Image.asset('images/site_$id.jpg'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            child: Container(
              height: 425,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Site $id',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                    ),
                    Divider(),
                    Text(
                      'Water Score: ${scores[id - 1]['water']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Geographic Score: ${scores[id - 1]['geographic']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Experience Score: ${scores[id - 1]['experience']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Average Score: ${scores[id - 1]['average']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    Center(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          Navigator.pushNamed(context, '/livestream/1');
                        },
                        child: Text("Go to origin drone"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
