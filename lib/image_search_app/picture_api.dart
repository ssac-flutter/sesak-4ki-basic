import 'dart:convert';

import 'package:flutter_pr_guide/image_search_app/model/picture.dart';
import 'package:http/http.dart' as http;

class PictureApi {
  Future<List<Picture>> getImages(String query) async {
    // 뻥
    // await Future.delayed(const Duration(seconds: 2));
    Uri url = Uri.parse(
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo');

    http.Response response = await http.get(url);
    print('Response status: ${response.statusCode}');

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    List<dynamic> hits = json['hits'];
    return hits.map((e) => Picture.fromJson(e)).toList();

    // 에러 발생
    // throw Exception('엄청난 에러');

    // 빈 리스트
    // return [];
  }
}
