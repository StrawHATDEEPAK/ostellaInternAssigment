import 'package:flutter/material.dart';
import 'package:ostello_intern_assignement/constants/constants.dart';

class SubjectListWidget extends StatelessWidget {
  final String title;
  const SubjectListWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5, bottom: 3),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 236, 228, 255),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color.fromARGB(255, 119, 85, 214),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 3.0, bottom: 3.0, left: 5.0, right: 5),
          child: Text(
            title,
            style: const TextStyle(
                color: Color.fromARGB(255, 119, 85, 214),
                fontFamily: AppFonts.internsans,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
