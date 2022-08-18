import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/data/repository/photo_repository.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/ui/main_action.dart';

import '../data/model/photo.dart';

class MainViewModel extends ChangeNotifier {
  // 데이터 저장소
  final _photoRepository = PhotoRepository();

  List<Photo> _photos = [];

  List<Photo> get photos => UnmodifiableListView(_photos); // 로딩

  bool isLoading = false;

  MainViewModel() {
    _fetchImages('');
  }

  void onAction(MainAction action) {
    if (action is AddAction) {
    } else if (action is GetImages) {
      _fetchImages(action.query);
    }
  }

  Future<void> _fetchImages(String query) async {
    isLoading = true;
    notifyListeners();

    _photos = await _photoRepository.getImages(query);
    isLoading = false;
    notifyListeners();
  }

  void _addAction() {
    print('아이콘 클릭 됨!');
  }
}
