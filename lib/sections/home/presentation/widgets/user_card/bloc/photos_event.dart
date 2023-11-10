part of 'photos_bloc.dart';

@immutable
sealed class PhotosEvent {}

class PhotosLoad extends PhotosEvent {}
