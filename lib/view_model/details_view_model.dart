import 'dart:developer';

import 'package:flutter/material.dart';

class DetailsController extends ChangeNotifier {
  bool priceOnTap = false;

  bool allTurffView = false;

  // void booking() {
  //   notifyListeners();
  // }

  void priceOntap() {
    priceOnTap = !priceOnTap;
    log(priceOnTap.toString());
    notifyListeners();
  }

  void allTurfView() {
    allTurffView = !allTurffView;
    log(allTurffView.toString());
    notifyListeners();
  }

  @override
  void dispose() {
    priceOnTap = false;
    log("++++++++++++++++++++");
    super.dispose();
  }
}
