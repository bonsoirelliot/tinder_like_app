part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeLoading extends HomeState {}

final class HomeError extends HomeState {
  final Exception error;

  HomeError({required this.error});
}

final class HomeSuccess extends HomeState {
  final List<UserModel> users;

  HomeSuccess({required this.users});
}
