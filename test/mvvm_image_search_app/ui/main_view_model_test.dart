import 'package:flutter_pr_guide/mvvm_image_search_app/ui/main_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('이미지 갯수는 20개 여야 한다', () async {
    final viewModel = MainViewModel();
    await viewModel.fetchImages('apple');

    expect(viewModel.photos.length, equals(20));
  });
}
