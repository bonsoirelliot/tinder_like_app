import 'package:tinder_like_app/sections/home/data/models/address_model.dart';
import 'package:tinder_like_app/sections/home/data/models/company_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressModel address;
  final String phone;
  final String website;
  final CompanyModel company;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$UserModelFromJson(json);
    } catch (e) {
      throw Exception('UserModel: $e');
    }
  }
}
