import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel {
  final String name;
  final String catchPhrase;
  final String bs;

  CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  String toBulletList() {
    final StringBuffer buffer = StringBuffer();

    buffer.write('Name: $name\n');
    buffer.write('Catch Phrase: $catchPhrase\n');
    buffer.write('BS: $bs');

    return buffer.toString();
  }

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$CompanyModelFromJson(json);
    } catch (e) {
      throw Exception('CompanyModel: $e');
    }
  }
}
