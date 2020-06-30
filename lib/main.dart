import 'package:flutter/material.dart';
import 'package:video_database/network/NetworkProvider.dart';
import 'package:video_database/ui/ItemList.dart';


void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BaseEndPoint network = NetworkProvider();
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
          backgroundColor: Colors.black,
          body: TabBarView(
            children: <Widget>[
              new FutureBuilder(
                  future: network.getMovieById("1"),
                  builder: (context, result) {
                    if (result.hasError) print(result.error);
                    return result.hasData
                        ? ItemList(list: result.data)
                        : Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              new FutureBuilder(
                  future: network.getMovieById("2"),
                  builder: (context, result) {
                    if (result.hasError) print(result.error);
                    return result.hasData
                        ? ItemList(list: result.data)
                        : Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}


