import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  dynamic currentPosition = ''.obs;
  Rx<String> currentAddress = ''.obs;
  late String district = '';
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Location',
          'Location services are disabled. Please enable location services for this App using the device settings.');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Location',
            'Location permissions are denied. Please enable location permissions for this App using the device settings.');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Location',
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    update();
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      _getAddressFromLatLng(currentPosition);
      update();
    }).catchError((e) {
      log(e.toString());
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
      currentPosition!.latitude,
      currentPosition.longitude,
    ).then((List<Placemark> placemarks) {
      final Placemark place = placemarks[0];
      currentAddress.value = '${place.locality}, ${place.administrativeArea}';
      district = place.subAdministrativeArea!;
    }).catchError((e) {
      log(e.toString());
    });
    update();
  }
}
