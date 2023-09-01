import 'dart:convert';

class CoachingDataModel {
  final String name;
  final String address;
  final double rating;
  final List<String> subjects;
  final String image;
  final int mutualFriendsStudyHere;
  final double distanceFromUser;
  final String offer;
  CoachingDataModel({
    required this.name,
    required this.address,
    required this.rating,
    required this.subjects,
    required this.image,
    required this.mutualFriendsStudyHere,
    required this.distanceFromUser,
    required this.offer,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'rating': rating,
      'subjects': subjects,
      'image': image,
      'mutualFriendsStudyHere': mutualFriendsStudyHere,
      'distanceFromUser': distanceFromUser,
      'offer': offer,
    };
  }

  factory CoachingDataModel.fromMap(Map<String, dynamic> map) {
    return CoachingDataModel(
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      subjects: List<String>.from(map['subjects']),
      image: map['image'] ?? '',
      mutualFriendsStudyHere: map['mutualFriendsStudyHere']?.toInt() ?? 0,
      distanceFromUser: map['distanceFromUser']?.toDouble() ?? 0.0,
      offer: map['offer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CoachingDataModel.fromJson(String source) =>
      CoachingDataModel.fromMap(json.decode(source));
}
