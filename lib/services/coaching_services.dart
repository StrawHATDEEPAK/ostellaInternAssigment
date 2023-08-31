import 'dart:convert';

import 'package:ostello_intern_assignement/dummy_data/coaching_data.dart';

import '../model/coaching_data_model.dart';

class CoachingServices {
  Future<List<CoachingDataModel>> getCoachingData() async {
    List<CoachingDataModel> coachingData = [];

    await Future.delayed(
      const Duration(seconds: 2),
      () {
        for (var i in CoachingDummyData.coachingData) {
          coachingData.add(CoachingDataModel.fromMap(i));
        }
      },
    );

    return coachingData;
  }
}
