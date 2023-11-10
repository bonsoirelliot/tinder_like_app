part of 'photos_bloc.dart';

@immutable
sealed class PhotosState {}

final class PhotosLoading extends PhotosState {}

final class PhotosError extends PhotosState {
  final Exception error;

  PhotosError({required this.error});
}

final class PhotosSuccess extends PhotosState {
  final List<PhotoModel> photos;

  PhotosSuccess({required this.photos});
}
