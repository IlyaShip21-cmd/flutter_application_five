// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniversityModel _$UniversityModelFromJson(Map<String, dynamic> json) =>
    UniversityModel(
      name: json['name'] as String,
      domains: (json['domains'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      webPages: (json['web_pages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      country: json['country'] as String,
      alphaTwoCode: json['alpha_two_code'] as String?,
      stateProvince: json['state-province'] as String?,
    );

Map<String, dynamic> _$UniversityModelToJson(UniversityModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'domains': instance.domains,
      'web_pages': instance.webPages,
      'country': instance.country,
      'alpha_two_code': instance.alphaTwoCode,
      'state-province': instance.stateProvince,
    };
