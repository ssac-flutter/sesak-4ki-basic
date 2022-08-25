import 'package:flutter_pr_guide/mvvm_image_search_app/data/data_source/pixabay_api.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/data/repository/photo_repository.dart';

import '../model/photo.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final _api = PixabayApi();

  @override
  Future<List<Photo>> getImages(String query) async {
    return await _api.getImages(query);
  }
}
