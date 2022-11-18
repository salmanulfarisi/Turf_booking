import 'package:flutter/material.dart';

class BottomNavigationBarViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int currentIndexSearch() {
    return _currentIndex;
  }
}
