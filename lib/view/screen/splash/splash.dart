import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/view_model/view_model.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageController = Provider.of<HomeViewModel>(context);
    final controller = Get.put(SplashScreenController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 2), () {
        homePageController.nearbyTurf();
      });
    });
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Turf Booking',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
