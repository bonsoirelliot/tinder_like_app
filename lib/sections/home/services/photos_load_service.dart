import 'package:dio/dio.dart';
import 'package:tinder_like_app/sections/home/data/models/photo/photo_model.dart';

class PhotosLoadService {
  static Future<List<PhotoModel>> loadPhotos(int albumId) async {
    final res = await Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    ).get(
      'https://jsonplaceholder.typicode.com/photos/',
      queryParameters: {
        'albumId': albumId,
      },
    );

    final photos =
        (res.data as List<dynamic>).map((e) => PhotoModel.fromJson(e)).toList();

    return photos;
  }
}
