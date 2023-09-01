import 'package:flutter/material.dart';

List<PopupMenuEntry<dynamic>> sortMenuItems = [
  const PopupMenuItem(
    value: 'relevance',
    child: Text('Relavance'),
  ),
  const PopupMenuItem(
    value: 'distance',
    child: Text('Distance'),
  ),
  const PopupMenuItem(
    value: 'price',
    child: Text('Price'),
  ),
  const PopupMenuItem(
    value: 'rating',
    child: Text('Rating'),
  ),

  // Add more PopupMenuItems as needed
];

List<PopupMenuEntry<dynamic>> distaneFromUserMenuItems = [
  const PopupMenuItem(
    value: 2,
    child: Text('<2km'),
  ),
  const PopupMenuItem(
    value: 5,
    child: Text('<5km'),
  ),
  const PopupMenuItem(
    value: 10,
    child: Text('<10km'),
  ),
  // Add more PopupMenuItems as needed
];

List<PopupMenuEntry<dynamic>> examMenuItems = [
  const PopupMenuItem(
    value: 'JEE',
    child: Text('JEE'),
  ),
  const PopupMenuItem(
    value: 'NEET',
    child: Text('NEET'),
  ),
  // Add more PopupMenuItems as needed
];

List<PopupMenuEntry<dynamic>> demoMenuItems = [
  const PopupMenuItem(
    value: 'option1',
    child: Text('Option 1'),
  ),
  const PopupMenuItem(
    value: 'option2',
    child: Text('Option 2'),
  ),
  const PopupMenuItem(
    value: 'option3',
    child: Text('Option 3'),
  ),
  // Add more PopupMenuItems as needed
];
