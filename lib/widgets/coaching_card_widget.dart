import 'package:flutter/material.dart';

class CoachingCardWidget extends StatelessWidget {
  final String name;
  final String address;
  final String rating;
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
      child: Container(
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
          color: Color.fromARGB(255, 236, 228, 255),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                  height: 150,
                  width: MediaQuery.of(context).size.width / 3,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Text(rating),
                    Text(distanceFromUser.toString()),
                  ],
                ),
                Text(offer),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
