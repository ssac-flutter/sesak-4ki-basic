import 'package:flutter_pr_guide/mvvm_image_search_app/data/data_source/pixabay_api.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/data/util/result.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/domain/repository/photo_repository.dart';

import '../../domain/model/photo.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final _api = PixabayApi();

  @override
  Future<Result<List<Photo>>> getImages(String query) async {
    return await _api.getImages(query);
  }
}
