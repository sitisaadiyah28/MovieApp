import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_database/model/ModelMovie.dart';
import 'package:video_database/network/NetworkProvider.dart';
import 'package:video_database/ui/DetailPage.dart';


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
        Movie data = list[index];
        return GestureDetector(
          onTap: (){
            Navigator.of(context).push(new
            MaterialPageRoute(builder: (BuildContext context) => DetailPage(
              title : data.title,
              image : data.image,
              genre : data.namaGenre,
              deskripsi : data.deskripsi
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
                        'http://192.168.43.159/videoplaylist/images/' + data.image
                    ),
                    fit: BoxFit.cover,
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}

