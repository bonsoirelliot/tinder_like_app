import 'package:json_annotation/json_annotation.dart';
import 'package:tinder_like_app/sections/home/data/models/user/address_model.dart';
import 'package:tinder_like_app/sections/home/data/models/user/company_model.dart';

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

  String toBulletList() {
    final StringBuffer buffer = StringBuffer();

    buffer.write('• ID: $id\n');
    buffer.write('• Username: $username\n');
    buffer.write('• Email: $email\n');
    buffer.write('• Address: ${address.toBulletList()}\n');
    buffer.write('• Phone: $phone\n');
    buffer.write('• Website: $website\n');
    buffer.write('• ${company.toBulletList()}\n');

    return buffer.toString();
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$UserModelFromJson(json);
    } catch (e) {
      throw Exception('UserModel: $e');
    }
  }
}
