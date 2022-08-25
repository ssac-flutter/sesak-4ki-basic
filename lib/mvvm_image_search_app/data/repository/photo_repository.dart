import 'package:flutter_pr_guide/mvvm_image_search_app/data/model/photo.dart';

abstract class PhotoRepository {
  Future<List<Photo>> getImages(String query);
}