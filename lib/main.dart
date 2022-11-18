import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_booking/utils/utils.dart';
import 'package:turf_booking/view/screen/splash/splash.dart';
import 'package:turf_booking/view_model/view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Providers.providers());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      navigatorKey: Navigations.navigatorKey,
      home: const SplashScreen(),
    );
  }
}
