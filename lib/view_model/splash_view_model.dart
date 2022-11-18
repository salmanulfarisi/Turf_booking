import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_booking/controllers/controllers.dart';
import 'package:turf_booking/view/screen/screen.dart';

class SplashScreenController extends GetxController {
  final locationController = Get.put(LocationController());
  // final HomePageController nearbyController = Get.put(HomePageController());

  @override
  void onInit() {
    // nearbyController.nearbyTruff();
    locationController.getCurrentPosition();
    checkUserLoggedIn();
    super.onInit();
  }

  checkUserLoggedIn() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final checked = pref.getString('Token');
    if (checked == null || checked.isEmpty) {
      await Future.delayed(const Duration(seconds: 2));
      Get.off(() => const LoginPage());
    } else {
      await Future.delayed(const Duration(seconds: 1));
      Get.off(() => const BottomNavigation());
    }
  }
}
