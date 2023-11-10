import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel {
  final int albumId;

  final int id;

  final String title;

  final String url;

  final String thumbnailUrl;

  PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$PhotoModelFromJson(json);
    } on Object catch (e) {
      throw Exception('PhotoModel: $e');
    }
  }
}
