import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:turf_booking/model/model.dart';
import 'package:turf_booking/utils/utils.dart';

class MobileVerifyService {
  static otpVerify(dynamic value) async {
    ErrorCode errorCode = ErrorCode();
    try {
      Response response =
          await Dio().post(Url.baseUrl + Url.mobileOTP, data: value);
      if (response.statusCode == 200) {
        final data = MobileVerificationResponseModel.fromJson(response.data);
        return data;
      }
    } on DioError catch (e) {
      return errorCode.status401(e);
    } catch (e) {
      getx.Get.snackbar("ERROR", "Something went wrong");
    }
  }
}
