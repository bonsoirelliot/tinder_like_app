import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tinder_like_app/sections/home/data/models/user/user_model.dart';
import 'package:tinder_like_app/sections/home/services/users_load_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UsersLoadService usersLoadService;

  HomeBloc({
    required this.usersLoadService,
  }) : super(HomeLoading()) {
    on<HomeLoadUsersEvent>(_onLoadUsers);

    add(HomeLoadUsersEvent());
  }

  Future<void> _onLoadUsers(
    HomeLoadUsersEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    try {
      final users = await usersLoadService.loadUsers();

      emit(HomeSuccess(users: users));
    } on Exception catch (e) {
      emit(HomeError(error: e));
    }
  }
}
