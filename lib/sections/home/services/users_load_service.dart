import 'package:tinder_like_app/common/domain/request_handler.dart';
import 'package:tinder_like_app/sections/home/data/models/user/user_model.dart';

class UsersLoadService {
  final rh = RequestHandler();

  Future<List<UserModel>> loadUsers() async {
    final res = await rh.get('/users/');

    final users =
        (res.data as List<dynamic>).map((e) => UserModel.fromJson(e)).toList();

    return users;
  }
}
