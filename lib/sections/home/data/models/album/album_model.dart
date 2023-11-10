import 'package:json_annotation/json_annotation.dart';

part 'album_model.g.dart';

@JsonSerializable()
class AlbumModel {
  final int userId;

  final int id;

  final String title;

  AlbumModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumModel.fromJson(Map<String,dynamic> json) {
     try {
      return _$AlbumModelFromJson(json);
    } on Object catch (e) {
      throw Exception('AlbumModel: $e');
    }
  }
}
