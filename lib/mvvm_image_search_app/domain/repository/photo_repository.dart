import 'package:flutter_pr_guide/mvvm_image_search_app/data/util/result.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/domain/model/photo.dart';

abstract class PhotoRepository {
  Future<Result<List<Photo>>> getImages(String query);
}