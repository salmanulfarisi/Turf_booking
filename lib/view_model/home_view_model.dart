import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:turf_booking/controllers/controllers.dart';

class HomeViewModel extends ChangeNotifier {
  final LocationController controller = Get.put(LocationController());
  bool isSearchClick = false;
  bool isLoading = false;
}
