import 'dart:convert';

import 'package:exam_app/Model/NewsModel.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  Future<NewsModel?> fetchApi(String country,String category) async {
    String uri =
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=dba58dc9c77d4f469c28bbb30c532b13";

    http.Response res = await http.get(Uri.parse(uri));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      NewsModel newsData = NewsModel.fromMap(data: decodedData);
      return newsData;
    }
  }
}
