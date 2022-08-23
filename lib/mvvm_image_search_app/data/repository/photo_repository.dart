import 'package:flutter_pr_guide/mvvm_image_search_app/data/data_source/pixabay_api.dart';

import '../model/photo.dart';

class PhotoRepository {
  final _api = PixabayApi();

  Future<List<Photo>> getImages(String query) async {
    return await _api.getImages(query);
  }
}