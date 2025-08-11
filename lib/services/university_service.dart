import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_five/models/university_model.dart';

class UniversityServs {
  static Future<List<UniversityModel>> getUniversities() async {
    try {
      final String jsonString = await rootBundle
          .loadString('assets/world_universities_and_domains.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList
          .map((json) => UniversityModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  static List<UniversityModel> search(
      List<UniversityModel> all, String? query) {
    if (query == null || query.trim().isEmpty) return [];
    final request = query.toLowerCase().trim();
    return all.where((n) {
      return n.name.toLowerCase().contains(request) ||
          n.country.toLowerCase().contains(request);
    }).toList();
  }
}
