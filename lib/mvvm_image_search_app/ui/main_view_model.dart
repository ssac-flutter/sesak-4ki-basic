import 'package:flutter/material.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/data/repository/photo_repository.dart';

import '../data/model/photo.dart';

class MainViewModel extends ChangeNotifier {
  // 데이터 저장소
  final _photoRepository = PhotoRepository();

  List<Photo> photos = [];

  // 로딩
  bool isLoading = false;

  MainViewModel() {
    fetchImages('');
  }

  Future<void> fetchImages(String query) async {
    isLoading = true;
    notifyListeners();

    photos = await _photoRepository.getImages(query);
    isLoading = false;
    notifyListeners();
  }
}
