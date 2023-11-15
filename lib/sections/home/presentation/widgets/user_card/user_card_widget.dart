import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_like_app/sections/home/data/models/photo/photo_model.dart';
import 'package:tinder_like_app/sections/home/data/models/user/user_model.dart';
import 'package:tinder_like_app/sections/home/presentation/widgets/user_card/bloc/photos_bloc.dart';
import 'package:tinder_like_app/sections/home/presentation/widgets/user_card/user_card_info_widget.dart';
import 'package:tinder_like_app/sections/home/presentation/widgets/user_card/user_photo_placeholder.dart';
import 'package:tinder_like_app/sections/home/presentation/widgets/user_card/user_photo_widget.dart';
import 'package:tinder_like_app/sections/home/services/album_load_service.dart';
import 'package:tinder_like_app/sections/home/services/photos_load_service.dart';

/// Карточка пользователя
class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    required this.model,
    super.key,
  });

  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PhotosBloc(
        albumsLoadService: AlbumsLoadService(userId: model.id),
        photosLoadService: PhotosLoadService(),
      ),
      child: BlocBuilder<PhotosBloc, PhotosState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state is PhotosSuccess)
                    UserPhotoWidget(
                      photo: state.photos.first.url,
                      onPressed: () => _showPhotosDialog(context, state.photos),
                    ),
                  if (state is PhotosLoading || state is PhotosError)
                    const UserPhotoPlaceholder(),
                  UserCardInfoWidget(model: model),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showPhotosDialog(BuildContext context, List<PhotoModel> photos) {
    showDialog(
      context: context,
      builder: (_) {
        final size = MediaQuery.of(context).size;
        return Center(
          child: Container(
            height: size.height * .6,
            width: size.width * .9,
            color: Colors.white,
            child: PageView.builder(
              controller: PageController(viewportFraction: .8),
              itemCount: photos.length,
              itemBuilder: (_, i) => Image.network(
                photos[i].url,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
