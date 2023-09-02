import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:ostello_intern_assignement/constants/constants.dart';
import 'package:ostello_intern_assignement/widgets/subject_list_widget.dart';

class CoachingCardWidget extends StatelessWidget {
  final String name;
  final String address;
  final double rating;
  final List<String> subjects;
  final String image;
  final int mutualFriendsStudyHere;
  final double distanceFromUser;
  final String offer;
  const CoachingCardWidget({
    Key? key,
    required this.name,
    required this.address,
    required this.rating,
    required this.subjects,
    required this.image,
    required this.mutualFriendsStudyHere,
    required this.distanceFromUser,
    required this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 196,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 236, 228, 255),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            child: Text(
              '• $mutualFriendsStudyHere of your school students study here',
              style: const TextStyle(
                  fontFamily: AppFonts.internsans,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            height: 160,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              color: const Color.fromARGB(255, 236, 228, 255),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: LoadingAnimationWidget.fourRotatingDots(
                                    color:
                                        const Color.fromARGB(255, 119, 85, 214),
                                    size: 35),
                              );
                            }
                          },
                          image: NetworkImage(
                            image,
                          ),
                          fit: BoxFit.cover,
                          height: 150,
                          width: MediaQuery.of(context).size.width / 2.8,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.8,
                          height: 35,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 119, 85, 214),
                                Colors.transparent
                              ],
                              stops: [0.0, 1],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2.76,
                              child: GestureDetector(
                                onTap: () {
                                  MapsLauncher.launchQuery(address);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                    Flexible(
                                      child: Text(
                                        address
                                            .split(',')
                                            .sublist(
                                                address.split(',').length - 3,
                                                address.split(',').length - 1)
                                            .join(','),
                                        maxLines: 1,
                                        style: const TextStyle(
                                            fontSize: 11,
                                            color: Colors.white,
                                            fontFamily: AppFonts.internsans,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              )))
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: AppFonts.internsans,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '⭐$rating',
                              style: const TextStyle(
                                fontFamily: AppFonts.internsans,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '•  ${distanceFromUser.toString()} km away',
                              style: const TextStyle(
                                  fontFamily: AppFonts.internsans,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Wrap(
                            direction: Axis.horizontal,
                            children: [
                              for (String subject in subjects)
                                SubjectListWidget(
                                  title: subject,
                                ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 119, 85, 214),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "Get $offer OFF",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 236, 228, 255),
                                  fontFamily: AppFonts.internsans,
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
