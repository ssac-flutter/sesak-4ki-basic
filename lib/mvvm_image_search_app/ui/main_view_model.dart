import 'package:flutter/material.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/data/repository/photo_repository.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/ui/main_action.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/ui/main_state.dart';

class MainViewModel extends ChangeNotifier {
  // 데이터 저장소
  final _photoRepository = PhotoRepository();

  MainState _state = const MainState();

  MainState get state => _state;

  MainViewModel() {
    _fetchImages('');
  }

  void onAction(MainAction action) {
    action.when(
      getImages: (query) {
        _fetchImages(query);
      },
      addAction: () {},
      refresh: () {},
    );
  }

  Future<void> _fetchImages(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final photos = await _photoRepository.getImages(query);
    _state = state.copyWith(
      photos: photos,
      isLoading: false,
    );
    notifyListeners();
  }

  void _addAction() {
    print('아이콘 클릭 됨!');
  }
}