import 'package:flutter/material.dart';
import 'package:ostello_intern_assignement/constants/constants.dart';
import 'package:ostello_intern_assignement/constants/filter_popup_options.dart';
import 'package:provider/provider.dart';

import '../provider/search_bar_filter_provider.dart';

class FilterChipWidget extends StatefulWidget {
  final String title;
  final IconData? icon;
  const FilterChipWidget({
    Key? key,
    required this.title,
    this.icon,
  }) : super(key: key);

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  bool isSelected = false;
  String selectedValue = '';

  @override
  void initState() {
    selectedValue = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchBarFilterProvider =
        Provider.of<SearchBarFilterProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(19),
        onTap: () {},
        child: PopupMenuButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
          itemBuilder: (context) {
            if (widget.title == 'Sort') return sortMenuItems;
            if (widget.title == '<2km') return distaneFromUserMenuItems;
            if (widget.title == 'Options') return demoMenuItems;
            if (widget.title == 'JEE') return examMenuItems;

            return demoMenuItems;
          },
          onSelected: (value) {
            debugPrint(' Selected Value = $value');
            setState(() {
              isSelected = true;
              selectedValue = value;
            });
            if (widget.title == 'Sort') {
              searchBarFilterProvider.setSort(value, true);
            }
            if (widget.title == '<2km') {
              searchBarFilterProvider.setDistance(value, true);
            }
            if (widget.title == 'Options') {}
            if (widget.title == 'JEE') {
              searchBarFilterProvider.setExamPrep(value, true);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color.fromARGB(255, 119, 85, 214)
                  : Colors.white,
              border: Border.all(
                  color: const Color.fromARGB(255, 119, 85, 214), width: 2),
              borderRadius: BorderRadius.circular(19),
            ),
            child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 5,
                  bottom: 5,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      selectedValue,
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: AppFonts.internsans,
                        color: isSelected
                            ? Colors.white
                            : const Color.fromARGB(255, 119, 85, 214),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    widget.icon == null
                        ? Container()
                        : Icon(
                            widget.icon,
                            color: isSelected
                                ? Colors.white
                                : const Color.fromARGB(255, 119, 85, 214),
                          ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
