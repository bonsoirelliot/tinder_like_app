import 'package:dio/dio.dart';
import 'package:tinder_like_app/sections/home/data/models/user/user_model.dart';

class UsersLoadService {
  static Future<List<UserModel>> loadUsers() async {
    final res = await Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    ).get('https://jsonplaceholder.typicode.com/users/');

    final users =
        (res.data as List<dynamic>).map((e) => UserModel.fromJson(e)).toList();

    return users;
  }
}
