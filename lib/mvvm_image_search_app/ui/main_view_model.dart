import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/data/repository/photo_repository.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/data/repository/photo_repository_impl.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/ui/main_action.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/ui/main_state.dart';

class MainViewModel extends ChangeNotifier {
  // 데이터 저장소
  late final PhotoRepository _photoRepository;

  MainState _state = const MainState();

  MainState get state => _state;

  final _eventController = StreamController<String>();

  Stream<String> get eventStream => _eventController.stream;

  MainViewModel({PhotoRepository? photoRepository}) {
    _photoRepository = (photoRepository ?? PhotoRepositoryImpl());
    _fetchImages('');
  }

  void onAction(MainAction action) {
    action.when(
      getImages: (query) {
        if (query.isEmpty) {
          _eventController.add('검색어를 입력해 주세요');
          return;
        }
        _fetchImages(query);
      },
      addAction: () {},
      refresh: () {},
    );
  }

  Future<void> _fetchImages(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _photoRepository.getImages(query);
    result.when(
      success: (photos) {
        _state = state.copyWith(
          photos: photos,
          isLoading: false,
        );
        notifyListeners();
      },
      error: (message) {
        _state = state.copyWith(
          photos: [],
          isLoading: false,
        );
        notifyListeners();
        _eventController.add(message);
      },
    );
  }

  void _addAction() {
    print('아이콘 클릭 됨!');
  }
}
