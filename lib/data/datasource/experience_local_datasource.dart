import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_portofolio/data/datasource/model/experience_model.dart';

class ExperienceLocalDatasource {
    Future<List<ExperienceModel>> getExperience() async {
    final jsonString =
        await rootBundle.loadString('assets/json/experience.json');

    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    final List<dynamic> data = jsonMap['experience'];

    return data
        .map((e) => ExperienceModel.fromJson(e))
        .toList();
  }
}