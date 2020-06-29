import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_database/HororPage.dart';
import 'package:video_database/IslamicPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Movie App'),
            centerTitle: true,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  child: Text('Islamic ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                ),
                Tab(
                  child: Text('Horor', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              IslamicPage(),
              HororPage(),
            ],
          ),
        ),
      ),
    );
  }
}
