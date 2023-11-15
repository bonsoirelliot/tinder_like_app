import 'package:tinder_like_app/common/domain/request_handler.dart';
import 'package:tinder_like_app/sections/home/data/models/album/album_model.dart';

class AlbumsLoadService {
  AlbumsLoadService({
    required this.userId,
  });

  final int userId;

  final rh = RequestHandler();

  Future<List<AlbumModel>> loadAlbums() async {
    final res = await rh.get(
      '/albums/',
      queryParameters: {
        'userId': userId,
      },
    );

    final albums =
        (res.data as List<dynamic>).map((e) => AlbumModel.fromJson(e)).toList();

    return albums;
  }
}
