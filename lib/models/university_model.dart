import 'package:json_annotation/json_annotation.dart';

part 'university_model.g.dart';

@JsonSerializable()
class UniversityModel {
  final String name;
  @JsonKey(defaultValue: [])
  final List<String> domains;
  @JsonKey(
    name: 'web_pages',
    defaultValue: [],
  )
  final List<String> webPages;
  final String country;
  @JsonKey(name: 'alpha_two_code')
  final String? alphaTwoCode;
  @JsonKey(name: 'state-province')
  final String? stateProvince;

  UniversityModel(
      {required this.name,
      required this.domains,
      required this.webPages,
      required this.country,
      this.alphaTwoCode,
      this.stateProvince});

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      _$UniversityModelFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityModelToJson(this);
}
