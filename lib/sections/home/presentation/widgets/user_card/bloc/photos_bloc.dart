import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tinder_like_app/sections/home/data/models/photo/photo_model.dart';
import 'package:tinder_like_app/sections/home/services/album_load_service.dart';
import 'package:tinder_like_app/sections/home/services/photos_load_service.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final AlbumsLoadService albumsLoadService;

  final PhotosLoadService photosLoadService;

  PhotosBloc({
    required this.albumsLoadService,
    required this.photosLoadService,
  }) : super(PhotosLoading()) {
    on<PhotosLoad>(_onLoadPhotos);

    add(PhotosLoad());
  }

  Future<void> _onLoadPhotos(
    PhotosLoad event,
    Emitter<PhotosState> emit,
  ) async {
    emit(PhotosLoading());

    try {
      final albums = await albumsLoadService.loadAlbums();

      final photos = await photosLoadService.loadPhotos(albums.first.id);

      emit(PhotosSuccess(photos: photos));
    } on Exception catch (e) {
      emit(PhotosError(error: e));
    }
  }
}
