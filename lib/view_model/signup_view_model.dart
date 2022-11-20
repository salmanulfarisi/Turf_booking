import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_booking/model/model.dart';
import 'package:turf_booking/services/services.dart';
import 'package:turf_booking/utils/utils.dart';
import 'package:turf_booking/view/screen/screen.dart';

class SignupController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final conformController = TextEditingController();
  SignupResponseModel? signUpRespoModel;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool isLoading = false;
  bool obscure = true;
  Future<void> signup(context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final conform = conformController.text.trim();
    if (password == conform) {
      if (email.isEmpty || password.isEmpty) {
        return;
      } else {
        SignupModel signupModel =
            SignupModel(userMail: email, userPassword: password);
        signUpRespoModel =
            await SignupService().signupUser(signupModel, context);
        if (signUpRespoModel == null) {
          log('nullllll');
          return;
        } else if (signUpRespoModel?.status == true) {
          log(signUpRespoModel!.status.toString());
          clearData(context);
          Navigations.push(const CodeVerificationScreen());
        }
      }
    } else {
      Get.snackbar("Error", "Password and conform password not match");
    }
    saveToSharedPref();
  }

  isobscure() {
    obscure = !obscure;
    notifyListeners();
  }

  Future<void> saveToSharedPref() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('email', emailController.text);
    pref.setString('password', passwordController.text);
  }

  Future<void> getSavedData() async {
    final pref = await SharedPreferences.getInstance();
    final predEmail = pref.getString('email');
    final predPassword = pref.getString('password');
    if (predEmail != null || predPassword != null) {
      emailController.text = predEmail.toString();
      passwordController.text = predPassword.toString();
    } else {
      Navigations.push(const LoginPage());
    }
  }

  Future<void> clearSavedData(context) async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  clearData(context) {
    conformController.clear();
    emailController.clear();
    passwordController.clear();
  }

  Future<void> saveToken(String token, String refreshToken) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('Token', token);
    pref.setString('RefreshToken', refreshToken);
  }
}
