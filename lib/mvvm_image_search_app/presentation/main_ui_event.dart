import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_ui_event.freezed.dart';

@freezed
class MainUiEvent with _$MainUiEvent {
  const factory MainUiEvent.showSnackBar(String message) = ShowSnackBar;

  const factory MainUiEvent.showDialog(String message) = ShowDialog;
}
