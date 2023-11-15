import 'package:tinder_like_app/common/domain/request_handler.dart';
import 'package:tinder_like_app/sections/home/data/models/photo/photo_model.dart';

class PhotosLoadService {
  final rh = RequestHandler();

  Future<List<PhotoModel>> loadPhotos(int albumId) async {
    final res = await rh.get(
      '/photos/',
      queryParameters: {
        'albumId': albumId,
      },
    );

    final photos =
        (res.data as List<dynamic>).map((e) => PhotoModel.fromJson(e)).toList();

    return photos;
  }
}
