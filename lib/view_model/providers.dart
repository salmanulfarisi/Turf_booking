import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/main.dart';
import 'package:turf_booking/view_model/view_model.dart';

class Providers {
  static Widget providers() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => SignupController()),
        ChangeNotifierProvider(create: (_) => BottomNavigationBarViewModel()),
        ChangeNotifierProvider(create: (_) => SoptViewModel()),
        ChangeNotifierProvider(create: (_) => EmailVerifyViewModel()),
        ChangeNotifierProvider(create: (_) => MobielOTPViewModel()),
        ChangeNotifierProvider(create: (_) => MobielVerifyViewModel()),
        ChangeNotifierProvider(create: (_) => DetailsController()),
      ],
      child: const MyApp(),
    );
  }
}
