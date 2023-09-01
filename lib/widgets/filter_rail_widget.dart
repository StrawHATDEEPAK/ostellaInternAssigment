import 'package:flutter/material.dart';
import 'package:ostello_intern_assignement/widgets/filter_chip_widgets.dart';

class FilterRailWidget extends StatelessWidget {
  const FilterRailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          FilterChipWidget(
            title: 'Filter',
            icon: Icons.filter_alt_outlined,
          ),
          FilterChipWidget(
            title: 'Sort',
            icon: Icons.keyboard_arrow_down_outlined,
          ),
          FilterChipWidget(
            title: '<2km',
          ),
          FilterChipWidget(
            title: 'JEE',
          ),
          FilterChipWidget(
            title: 'Options',
            icon: Icons.density_medium_outlined,
          ),
          FilterChipWidget(
            title: 'Options',
            icon: Icons.density_medium_outlined,
          ),
        ],
      ),
    );
  }
}
