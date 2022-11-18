import 'package:flutter/cupertino.dart';

class SoptViewModel extends ChangeNotifier {
  bool isLoading = false;
  Future<void> allTurff() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
    notifyListeners();
  }
}
