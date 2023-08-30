import 'package:flutter/material.dart';
import 'package:ostello_intern_assignement/widgets/filter_chip_widgets.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  final searchTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xff483285),
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
                'For JEE-Mains',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchTextEditingController,
              decoration: InputDecoration(
                hintText: "Search for UPSC Coaching",
                enabledBorder: OutlineInputBorder(
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
                          color: Colors.black,
                        )),
                    const Divider(
                      color: Colors.black,
                      thickness: 10,
                      height: 10,
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.mic))
                  ],
                ),
              ),
            ),
          ),
          const FilterChipWidget(
            title: "Sort",
            isSelected: false,
            icon: Icons.keyboard_arrow_down_outlined,
          ),
        ],
      ),
    );
  }
}
