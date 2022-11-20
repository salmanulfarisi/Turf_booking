import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_booking/model/mobile_model.dart';
import 'package:turf_booking/services/mobile_service.dart';
import 'package:turf_booking/utils/utils.dart';
import 'package:turf_booking/view/screen/screen.dart';

class MobielOTPViewModel extends ChangeNotifier {
  final TextEditingController numberTextField = TextEditingController();
  MobileNumberRespoModel? mobileId;
  Future<void> loginMobileOTP(context) async {
    final number = numberTextField.text;
    if (number.isEmpty) {
      log(number);
      const Text('empty quriery');
    } else {
      MobileNumberRespoModel? model =
          await MobilNumberServices.instance.otpverfying(number);
      log("dsfjonvojsvoomv${model.toString()}");
      saveMobileOtp();
      Navigations.push(const MobileVerificationScreen());
    }
  }

  Future<void> saveMobileOtp() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('mobilenumber', numberTextField.text.trim());
  }
}
