import 'package:flutter/material.dart';


class DetailPage extends StatefulWidget {
  String title, deskripsi, genre, image;
  DetailPage({this.title, this.deskripsi, this.genre, this.image});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Movie'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height/2,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'http://192.168.43.159/videoplaylist/images/' + widget.image
                  ),
                  fit: BoxFit.fill,
                )
            ),
          ),
          Container(

          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Text('Judul               : ' +  widget.title, style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Text('Genre               : ' +  widget.genre, style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Text('Deskripsi : ', style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
            child: Text(widget.deskripsi, style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20, color: Colors.white),
              textAlign: TextAlign.justify,
            ),
          ),

        ],
      ),
    );
  }
}
