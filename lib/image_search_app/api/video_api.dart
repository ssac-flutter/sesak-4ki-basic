import 'dart:convert';

import 'package:flutter_pr_guide/image_search_app/model/video.dart';
import 'package:http/http.dart' as http;

class VideoApi {
  Future<List<Video>> getVideos(String query) async {
    Uri url = Uri.parse(
        'https://pixabay.com/api/videos/?key=10711147-dc41758b93b263957026bdadb&q=$query');

    http.Response response = await http.get(url);
    print('Response status: ${response.statusCode}');

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    List<dynamic> hits = json['hits'];
    return hits.map((e) => Video.fromJson(e)).toList();
  }
}
