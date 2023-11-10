import 'package:json_annotation/json_annotation.dart';
import 'package:tinder_like_app/sections/home/data/models/user/geo_model.dart';


part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoModel geo;

  AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  String toBulletList() {
    final StringBuffer buffer = StringBuffer();

    buffer.write('Street: $street\n');
    buffer.write('Suite: $suite\n');
    buffer.write('City: $city\n');
    buffer.write('Zipcode: $zipcode\n');
    buffer.write('Geo: ${geo.toBulletList()}\n');

    return buffer.toString();
  }

  factory AddressModel.fromJson(Map<String,dynamic> json) {
     try {
      return _$AddressModelFromJson(json);
    } catch (e) {
      throw Exception('AddressModel: $e');
    }
  }
}
