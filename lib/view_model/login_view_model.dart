import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_booking/model/model.dart';
import 'package:turf_booking/services/login_service.dart';
import 'package:turf_booking/utils/utils.dart';
import 'package:turf_booking/view/screen/screen.dart';
import 'package:turf_booking/view_model/view_model.dart';

class LoginViewModel extends ChangeNotifier {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscure = true;
  bool isLoading = false;

  Future<void> loginUser(context) async {
    final signupController =
        Provider.of<SignupController>(context, listen: false);
    isLoading = true;
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("title", "Enter email and password");
    } else {
      LoginModel model = LoginModel(userMail: email, userPassword: password);
      LoginRespoModel? loginRespoModel =
          await LoginService.instance.userLogin(model, context);
      var token = loginRespoModel!.token;
      var refreshToken = loginRespoModel.refreshToken;
      log("token: $token && refreshToken: $refreshToken");
      signupController.saveToken(token!, refreshToken!);
      signupController.saveToSharedPref();
      if (loginRespoModel.status == true) {
        isLoading = false;
        Navigations.push(const BottomNavigation());
        saveUserLoggedIn();
      } else if (loginRespoModel.status == null) {
        isLoading = false;
        Get.snackbar("Error", "Something went wrong");
      } else {
        isLoading = false;
        Get.snackbar("Error", "$loginRespoModel.message");
      }
    }
  }

  Future<void> saveUserLoggedIn() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("userloggedin", true);
  }

  isobscure() {
    obscure = !obscure;
    notifyListeners();
  }
}
