import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_database/DetailPage.dart';


class HororPage extends StatefulWidget {
  @override
  _HororPageState createState() => _HororPageState();
}

class _HororPageState extends State<HororPage> {
  getData() async {
    final response =
    await http.get("http://192.168.43.159/videoplaylist/getData2.php");

    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  new FutureBuilder(
          future: getData(),
          builder: (context, result) {
            if (result.hasError) print(result.error);
            return result.hasData
                ? ItemList(list: result.data)
                : Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7
      ),
      itemBuilder: (BuildContext context, int index){
        return GestureDetector(
          onTap: (){
            Navigator.of(context).push(new
            MaterialPageRoute(builder: (BuildContext context) => DetailPage(
                list: list, index: index
            )));
          },
          child: Card(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0,left: 10.0, bottom: 10.0, right: 10.0),
                  child: Image(
                    image: NetworkImage(
                        'http://192.168.43.159/videoplaylist/images/' +
                            list[index]['image']
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                /*Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 180),
                  child: Text('Judul : ${list[index]['title']}',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),*/

              ],
            ),
          ),
        );
      },
    );
  }
}

