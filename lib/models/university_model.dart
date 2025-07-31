// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UniversityModel {
  final String name;
  final List<String> domains;
  final List<String> webPages;
  final String country;
  final String alphaTwoCode;
  final String? stateProvince;

  UniversityModel(
      {required this.name,
      required this.domains,
      required this.webPages,
      required this.country,
      required this.alphaTwoCode,
      this.stateProvince});

  factory UniversityModel.fromMap(Map<String, dynamic> map) {
    return UniversityModel(
      name: map['name'] as String,
      domains: List<String>.from(
        (map['domains'] as List),
      ),
      webPages: List<String>.from(
        (map['web_pages'] as List),
      ),
      country: map['country'] as String,
      alphaTwoCode: map['alpha_two_code']! as String,
      stateProvince: map['state-province'] != null
          ? map['state-province'] as String
          : null,
    );
  }

  factory UniversityModel.fromJson(String source) =>
      UniversityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
