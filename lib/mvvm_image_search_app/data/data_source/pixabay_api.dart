import 'dart:async';
import 'dart:convert';

import 'package:flutter_pr_guide/mvvm_image_search_app/data/util/result.dart';
import 'package:http/http.dart' as http;

import '../../domain/model/photo.dart';

class PixabayApi {
  final http.Client _client;

  PixabayApi({http.Client? client}) : _client = (client ?? http.Client());

  Future<Result<List<Photo>>> getImages(String query) async {
    try {
      Uri url = Uri.parse(
          'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo');

      http.Response response = await _client.get(url);
      print('Response status: ${response.statusCode}');

      String jsonString = response.body;

      Map<String, dynamic> json = jsonDecode(jsonString);
      List<dynamic> hits = json['hits'];
      List<Photo> items = hits.map((e) => Photo.fromJson(e)).toList();
      return Result.success(items);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
