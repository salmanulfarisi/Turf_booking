import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/model/model.dart';
import 'package:turf_booking/services/services.dart';
import 'package:turf_booking/utils/utils.dart';
import 'package:turf_booking/view/screen/home/home.dart';
import 'package:turf_booking/view_model/view_model.dart';

class MobielVerifyViewModel extends ChangeNotifier {
  final phoneEditingController = TextEditingController();
  MobielOTPViewModel controller = MobielOTPViewModel();

  Future<void> verifyMobileOtp(context) async {
    final mobileOtp = phoneEditingController.text.trim();
    if (mobileOtp.isEmpty) {
      Get.snackbar("Error", "Please enter mobile number");
    } else {
      final mobileController =
          Provider.of<MobielOTPViewModel>(context, listen: false);
      MobileVerificationResponseModel model = MobileVerificationResponseModel(
        otp: mobileOtp,
        id: mobileController.mobileId!.id,
        number: controller.numberTextField.text,
      );
      MobileVerificationResponseModel result =
          await MobileVerifyService.otpVerify(model.tojson());
      print(result.number.toString());
      if (result.status != false) {
        Navigations.push(const HomePage());
      } else {
        Get.snackbar("Error", "Something went wrong");
      }
    }
  }
}
