import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/model/model.dart';
import 'package:turf_booking/services/services.dart';
import 'package:turf_booking/utils/utils.dart';
import 'package:turf_booking/view/screen/screen.dart';
import 'package:turf_booking/view_model/view_model.dart';

class EmailVerifyViewModel extends ChangeNotifier {
  final emailController = TextEditingController();

  Future<void> verifyEmailOtp() async {
    final emailOTP = emailController.text.trim();
    if (emailOTP.isEmpty) {
      Get.snackbar("Error", "Please enter OTP");
    } else {
      final signupController =
          Provider.of<SignupController>(Get.context!, listen: false);
      SignupEmailVerifyModel model = SignupEmailVerifyModel(
          userOtp: emailOTP, id: signupController.signUpRespoModel!.id);
      SignupEmailVerifyModel result =
          await EmailVerificationService.emailVerifying(model.tojson());

      if (result.status != false) {
        Navigations.pushReplace(const BottomNavigation());
      } else {
        Get.snackbar("Error", "${result.message}");
      }
    }
  }
}
