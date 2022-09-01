import 'dart:async';

import 'package:flutter_pr_guide/mvvm_image_search_app/data/repository/photo_repository_impl.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/domain/repository/photo_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'main_action.dart';
import 'main_state.dart';
import 'main_ui_event.dart';

class MainViewModel extends StateNotifier<MainState> {
  // 데이터 저장소
  late final PhotoRepository _photoRepository;

  final _eventController = StreamController<MainUiEvent>();

  Stream<MainUiEvent> get eventStream => _eventController.stream;

  MainViewModel({PhotoRepository? photoRepository}) : super(const MainState()) {
    _photoRepository = (photoRepository ?? PhotoRepositoryImpl());
    _fetchImages('');
  }

  void onAction(MainAction action) {
    action.when(
      getImages: (query) {
        if (query.isEmpty) {
          _eventController.add(const MainUiEvent.showDialog('검색어를 입력해 주세요'));
          return;
        }
        _fetchImages(query);
      },
      addAction: () {},
      refresh: () {},
    );
  }

  Future<void> _fetchImages(String query) async {
    state = state.copyWith(isLoading: true);

    final result = await _photoRepository.getImages(query);
    result.when(
      success: (photos) {
        state = state.copyWith(
          photos: photos,
          isLoading: false,
        );
      },
      error: (message) {
        state = state.copyWith(
          photos: [],
          isLoading: false,
        );
        _eventController.add(MainUiEvent.showSnackBar(message));
      },
    );
  }

  void _addAction() {
    print('아이콘 클릭 됨!');
  }
}
