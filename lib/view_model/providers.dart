import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/main.dart';
import 'package:turf_booking/view_model/home_view_model.dart';
import 'package:turf_booking/view_model/login_view_model.dart';

class Providers {
  static Widget providers() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ],
      child: const MyApp(),
    );
  }
}
