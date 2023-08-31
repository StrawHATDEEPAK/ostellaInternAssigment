import 'package:flutter/material.dart';
import 'package:ostello_intern_assignement/services/coaching_services.dart';
import 'package:ostello_intern_assignement/widgets/coaching_card_widget.dart';

import '../model/coaching_data_model.dart';

class CoachingListWidget extends StatefulWidget {
  const CoachingListWidget({super.key});

  @override
  State<CoachingListWidget> createState() => _CoachingListWidgetState();
}

class _CoachingListWidgetState extends State<CoachingListWidget> {
  Future<List<CoachingDataModel>>? coachingList;
  final coachingServices = CoachingServices();
  @override
  void initState() {
    getCoachingsList();
    super.initState();
  }

  void getCoachingsList() {
    coachingList = coachingServices.getCoachingData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CoachingDataModel>>(
      future: coachingList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return CoachingCardWidget(
                      name: snapshot.data![index].name,
                      address: snapshot.data![index].address,
                      rating: snapshot.data![index].rating,
                      subjects: snapshot.data![index].subjects,
                      image: snapshot.data![index].image,
                      mutualFriendsStudyHere:
                          snapshot.data![index].mutualFriendsStudyHere,
                      distanceFromUser: snapshot.data![index].distanceFromUser,
                      offer: snapshot.data![index].offer);
                },
              ),
            );
          }
        }

        return const Text(
          "No data found",
          style: TextStyle(color: Colors.black),
        );
      },
    );
  }
}
