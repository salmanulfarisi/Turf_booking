import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_booking/model/nearby_model/nearby_model.dart';
import 'package:turf_booking/services/services.dart';

class SoptViewModel extends ChangeNotifier {
  List<Datum> allTruff = [];
  List<Datum> searchItems = [];
  bool isLoading = false;

  oninit() async {
    await allTurff();
  }

  Future<void> allTurff() async {
    isLoading = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("Token");
    HomeResponse? allTruffRespo = await AllTurfService.instance.allTurf(token!);
    if (allTruffRespo != null && allTruffRespo.status == true) {
      allTruff.clear();
      allTruff.addAll(allTruffRespo.data!);
    }
    isLoading = false;
    notifyListeners();
  }

  void search(String data) {
    List<Datum> searchingItem = [];
    if (data.isEmpty) {
      searchItems = allTruff;
    } else {
      searchItems = allTruff.where((element) {
        return element.turfName!.toLowerCase().contains(data.toLowerCase());
      }).toList();
    }
    searchItems = searchingItem;
    notifyListeners();
  }
}
