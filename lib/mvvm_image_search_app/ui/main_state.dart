import 'package:flutter_pr_guide/mvvm_image_search_app/data/model/photo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default([]) List<Photo> photos,
    @Default(false) bool isLoading,
  }) = _MainState;
}
