import 'package:flutter_pr_guide/mvvm_image_search_app/data/model/photo.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/data/repository/photo_repository.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/ui/main_action.dart';
import 'package:flutter_pr_guide/mvvm_image_search_app/ui/main_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('이미지가 잘 들어와야 한다', () async {
    final viewModel = MainViewModel(photoRepository: MockPhotoRepository());

    viewModel.onAction(const MainAction.getImages('query'));
    await Future.delayed(const Duration(seconds: 2));

    expect(viewModel.state.photos.length, 3);
    expect(viewModel.state.photos.first.tags, 'google');
  });
}

class MockPhotoRepository implements PhotoRepository {
  @override
  Future<List<Photo>> getImages(String query) async {
    await Future.delayed(const Duration(seconds: 1));
    return const [
      Photo(
        previewUrl: 'http://www.google.com',
        tags: 'google',
      ),
      Photo(
        previewUrl: 'http://www.facebook.com',
        tags: 'facebook',
      ),
      Photo(
        previewUrl: 'http://www.kakao.com',
        tags: 'kakao',
      ),
    ];
  }
}
