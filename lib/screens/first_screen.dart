import 'package:flutter/material.dart';
import 'package:ostello_intern_assignement/constants/constants.dart';
import 'package:ostello_intern_assignement/provider/search_bar_filter_provider.dart';
import 'package:ostello_intern_assignement/widgets/coaching_list_widget.dart';
import 'package:ostello_intern_assignement/widgets/filter_rail_widget.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  final searchTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final searchBarFilterProvider =
        Provider.of<SearchBarFilterProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 119, 85, 214),
                  child: IconButton(
                    // iconSize: 20,
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      // size: 15,
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'For JEE Mains',
                  style:
                      TextStyle(fontSize: 20, fontFamily: AppFonts.internsans),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchTextEditingController,
                style: const TextStyle(fontFamily: AppFonts.internsans),
                decoration: InputDecoration(
                  hintText: "Search for UPSC Coaching",
                  hintStyle: const TextStyle(fontFamily: AppFonts.internsans),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 119, 85, 214),
                          )),
                      const Divider(
                        color: Color.fromARGB(255, 119, 85, 214),
                        thickness: 2,
                        height: 20,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.mic,
                            color: Color.fromARGB(255, 119, 85, 214),
                          ))
                    ],
                  ),
                ),
                onSubmitted: (value) {
                  searchBarFilterProvider.setSearchWord(value);
                },
              ),
            ),
            const FilterRailWidget(),
            const CoachingListWidget()
          ],
        ),
      ),
    );
  }
}
