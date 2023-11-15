import 'package:dio/dio.dart';
import 'package:tinder_like_app/const/satic_data.dart';

class RequestHandler {
  static final RequestHandler _singleton = RequestHandler._init();

  late Dio _dio;

  factory RequestHandler() {
    final handler = _singleton;

    return handler;
  }

  RequestHandler._init() {
    _dio = _createDio();
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    late Response<T> res;

    try {
      res = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw Exception(e);
    }

    return res;
  }

  Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(milliseconds: 20000),
        receiveTimeout: const Duration(milliseconds: 40000),
        baseUrl: StaticData.apiUrl,
      ),
    );

    return dio;
  }
}
