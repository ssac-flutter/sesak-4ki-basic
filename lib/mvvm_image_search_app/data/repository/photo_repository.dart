import 'package:flutter_pr_guide/mvvm_image_search_app/data/model/photo.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/data/util/result.dart';

abstract class PhotoRepository {
  Future<Result<List<Photo>>> getImages(String query);
}