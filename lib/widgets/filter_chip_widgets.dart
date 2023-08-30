import 'package:flutter/material.dart';

class FilterChipWidget extends StatefulWidget {
  final String title;
  final bool isSelected;
  final IconData icon;
  const FilterChipWidget({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.icon,
  }) : super(key: key);

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff483285)),
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
                widget.title,
                style: const TextStyle(fontSize: 17),
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(widget.icon),
            ],
          )),
    );
  }
}
