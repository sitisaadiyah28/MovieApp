import 'package:flutter/material.dart';


class DetailPage extends StatefulWidget {
  List list;
  int index;
  DetailPage({this.list, this.index});
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
                      'http://192.168.43.159/videoplaylist/images/' + widget.list[widget.index]['image']
                  ),
                  fit: BoxFit.fill,
                )
            ),
          ),
          Container(

          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Text('Judul               : ' +  widget.list[widget.index]['title'], style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Text('Genre               : ' +  widget.list[widget.index]['nama_genre'], style: TextStyle(fontWeight: FontWeight.bold,
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
            child: Text(widget.list[widget.index]['deskripsi'], style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20, color: Colors.white),
              textAlign: TextAlign.justify,
            ),
          ),

        ],
      ),
    );
  }
}
