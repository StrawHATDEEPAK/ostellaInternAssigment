import 'package:flutter/material.dart';

class SearchBarFilterProvider extends ChangeNotifier {
  int _distance = 0;
  int _rating = 0;
  String _sort = '';
  String _examPrep = '';
  String _searchWord = '';

  bool _sortSelected = false;
  bool _distanceSelected = false;
  bool _examPrepSelected = false;
  bool _ratingSelected = false;

  int get distance => _distance;
  int get rating => _rating;
  String get sort => _sort;
  String get examPrep => _examPrep;
  String get searchWord => _searchWord;

  bool get sortSelected => _sortSelected;
  bool get distanceSelected => _distanceSelected;
  bool get examPrepSelected => _examPrepSelected;
  bool get ratingSelected => _ratingSelected;

  void setDistance(int distance, bool isSelected) {
    _distance = distance;
    _distanceSelected = isSelected;
    notifyListeners();
  }

  void setRating(int rating) {
    _rating = rating;
    notifyListeners();
  }

  void setSort(String sort, bool isSelected) {
    _sort = sort;
    _sortSelected = isSelected;
    notifyListeners();
  }

  void setExamPrep(String examPrep, bool isSelected) {
    _examPrep = examPrep;
    _examPrepSelected = isSelected;
    notifyListeners();
  }

  void setSearchWord(String searchWord) {
    _searchWord = searchWord;
    notifyListeners();
  }
}
