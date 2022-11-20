import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_booking/controllers/controllers.dart';
import 'package:turf_booking/model/model.dart';
import 'package:turf_booking/services/nearby_service.dart';
import 'package:turf_booking/utils/utils.dart';
import 'package:turf_booking/view/screen/screen.dart';

class HomeViewModel extends ChangeNotifier {
  final LocationController controller = Get.put(LocationController());
  bool isSearchClick = false;
  bool isLoading = false;
  List<Datum> near = [];

  Future<void> nearbyTurf() async {
    isLoading = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('Token');
    log(token.toString());
    final place = controller.district;
    log("=================${place.toString()}");
    HomeResponse? nearResponse =
        await NearbyService.instance.nearbyTurf("Malappuram", token!);
    log(controller.district.toString());
    if (nearResponse != null && nearResponse.status == true) {
      near.clear();
      near.addAll(nearResponse.data!);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    Navigations.pushRemoveUntil(const LoginPage());
    notifyListeners();
  }
}
