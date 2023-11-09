import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tinder_like_app/sections/home/data/models/user_model.dart';
import 'package:tinder_like_app/sections/home/services/users_load_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoading()) {
    on<HomeLoadUsersEvent>(_onLoadUsers);

    add(HomeLoadUsersEvent());
  }

  Future<void> _onLoadUsers(
    HomeLoadUsersEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    try {
      final users = await UsersLoadService.loadUsers();

      emit(HomeSuccess(users: users));
    } on Exception catch (e) {
      emit(HomeError(error: e));
    }
  }
}
