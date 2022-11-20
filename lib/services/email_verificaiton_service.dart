import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:turf_booking/model/model.dart';
import 'package:turf_booking/utils/utils.dart';

class EmailVerificationService {
  static emailVerifying(dynamic value) async {
    ErrorCode errorCode = ErrorCode();
    try {
      Response response =
          await Dio().post(Url.baseUrl + Url.emailOTP, data: value);
      if (response.statusCode == 200) {
        getx.Get.snackbar("Success", "OTP send to your email");
        return SignupEmailVerifyModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      return errorCode.status401(e);
    } catch (e) {
      getx.Get.snackbar("Error", "Something went wrong");
    }
  }
}
