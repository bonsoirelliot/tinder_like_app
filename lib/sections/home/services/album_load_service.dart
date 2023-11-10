import 'package:dio/dio.dart';
import 'package:tinder_like_app/sections/home/data/models/album/album_model.dart';

class AlbumsLoadService {
  static Future<List<AlbumModel>> loadAlbums(int userId) async {
    final res = await Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    ).get(
      'https://jsonplaceholder.typicode.com/albums/',
      queryParameters: {
        'userId': userId,
      },
    );

    final albums =
        (res.data as List<dynamic>).map((e) => AlbumModel.fromJson(e)).toList();

    return albums;
  }
}
