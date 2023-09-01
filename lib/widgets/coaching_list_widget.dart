import 'package:flutter/material.dart';
import 'package:ostello_intern_assignement/services/coaching_services.dart';
import 'package:ostello_intern_assignement/widgets/coaching_card_widget.dart';
import 'package:provider/provider.dart';

import '../model/coaching_data_model.dart';
import '../provider/search_bar_filter_provider.dart';

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
    final searchBarFilterProvider =
        Provider.of<SearchBarFilterProvider>(context, listen: true);
    return FutureBuilder<List<CoachingDataModel>>(
      future: coachingList,
      builder: (context, snapshot) {
        debugPrint(snapshot.data.toString());
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              SizedBox(
                height: 200,
              ),
              CircularProgressIndicator()
            ],
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            List<CoachingDataModel> coachingData = snapshot.data!;
            List<CoachingDataModel> filteredCoachingData = coachingData;

            if (searchBarFilterProvider.searchWord.isNotEmpty) {
              filteredCoachingData = coachingData
                  .where((element) => element.name
                      .toLowerCase()
                      .contains(searchBarFilterProvider.searchWord))
                  .toList();
            }
            if (searchBarFilterProvider.sortSelected) {
              if (searchBarFilterProvider.sort == 'Rating') {
                filteredCoachingData
                    .sort((a, b) => a.rating.compareTo(b.rating));
              }

              if (searchBarFilterProvider.sort == 'distance') {
                filteredCoachingData.sort(
                    (a, b) => a.distanceFromUser.compareTo(b.distanceFromUser));
              }

              if (searchBarFilterProvider.sort == 'price') {
                filteredCoachingData.sort((a, b) => a.offer.compareTo(b.offer));
              }

              if (searchBarFilterProvider.sort == 'relevance') {
                filteredCoachingData.sort((b, a) => a.mutualFriendsStudyHere
                    .compareTo(b.mutualFriendsStudyHere));
              }
            }
            if (searchBarFilterProvider.distanceSelected) {
              filteredCoachingData.where((element) =>
                  element.distanceFromUser < searchBarFilterProvider.distance);
            }
            if (searchBarFilterProvider.examPrepSelected) {
              if (searchBarFilterProvider.examPrep == 'JEE') {
                filteredCoachingData = coachingData
                    .where((element) => element.subjects.contains('JEE'))
                    .toList();
              }
              if (searchBarFilterProvider.examPrep == 'NEET') {
                filteredCoachingData = coachingData
                    .where((element) => element.subjects.contains('NEET'))
                    .toList();
              }
            }
            if (searchBarFilterProvider.distanceSelected) {
              if (searchBarFilterProvider.distance != 0) {
                filteredCoachingData = coachingData
                    .where((element) =>
                        element.distanceFromUser <
                        searchBarFilterProvider.distance)
                    .toList();
              }
            }

            return Expanded(
              child: ListView.builder(
                itemCount: filteredCoachingData.length,
                itemBuilder: (context, index) {
                  return CoachingCardWidget(
                      name: filteredCoachingData[index].name,
                      address: filteredCoachingData[index].address,
                      rating: filteredCoachingData[index].rating,
                      subjects: filteredCoachingData[index].subjects,
                      image: filteredCoachingData[index].image,
                      mutualFriendsStudyHere:
                          filteredCoachingData[index].mutualFriendsStudyHere,
                      distanceFromUser:
                          filteredCoachingData[index].distanceFromUser,
                      offer: filteredCoachingData[index].offer);
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
