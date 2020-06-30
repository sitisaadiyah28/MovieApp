import 'package:video_database/constant/ConstantFile.dart';
import 'package:http/http.dart'as http;
import 'package:video_database/model/ModelMovie.dart';

abstract class BaseEndPoint{

  Future<List> getMovieById(String id);

}

class NetworkProvider extends BaseEndPoint{
  @override
  Future<List> getMovieById(String id)async {
    // TODO: implement getMovieById
    final response = await http.post(ConstantFile().baseUrl + "getMovieById", body: {
      'idgenre' : id
    });

    ModelMovie listData = modelMovieFromJson(response.body);
    return listData.movie;
  }

}