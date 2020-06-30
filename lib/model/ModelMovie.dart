// To parse this JSON data, do
//
//     final modelMovie = modelMovieFromJson(jsonString);

import 'dart:convert';

ModelMovie modelMovieFromJson(String str) => ModelMovie.fromJson(json.decode(str));

String modelMovieToJson(ModelMovie data) => json.encode(data.toJson());

class ModelMovie {
  ModelMovie({
    this.message,
    this.status,
    this.movie,
  });

  String message;
  int status;
  List<Movie> movie;

  factory ModelMovie.fromJson(Map<String, dynamic> json) => ModelMovie(
    message: json["message"],
    status: json["status"],
    movie: List<Movie>.from(json["movie"].map((x) => Movie.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "movie": List<dynamic>.from(movie.map((x) => x.toJson())),
  };
}

class Movie {
  Movie({
    this.idVideo,
    this.title,
    this.deskripsi,
    this.idGenre,
    this.image,
    this.namaGenre,
  });

  String idVideo;
  String title;
  String deskripsi;
  String idGenre;
  String image;
  String namaGenre;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    idVideo: json["id_video"],
    title: json["title"],
    deskripsi: json["deskripsi"],
    idGenre: json["id_genre"],
    image: json["image"],
    namaGenre: json["nama_genre"],
  );

  Map<String, dynamic> toJson() => {
    "id_video": idVideo,
    "title": title,
    "deskripsi": deskripsi,
    "id_genre": idGenre,
    "image": image,
    "nama_genre": namaGenre,
  };
}
