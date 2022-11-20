import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:turf_booking/model/mobile_model.dart';
import 'package:turf_booking/utils/utils.dart';

class MobilNumberServices {
  MobilNumberServices._instance();
  static final MobilNumberServices instance = MobilNumberServices._instance();
  factory MobilNumberServices() {
    return instance;
  }
  ErrorCode errorCode = ErrorCode();
  Future<MobileNumberRespoModel?> otpverfying(dynamic value) async {
    log(value);
    log('message');
    try {
      Response response = await Dio().post(
        Url.baseUrl + Url.mobileUrl,
        data: value,
      );
      log(response.toString());
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        getx.Get.snackbar("Success", "Login Successfully");
        return MobileNumberRespoModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('error');
      return errorCode.status401(e);
    } catch (e) {
      log('error222');
      getx.Get.snackbar("Error", "Error Founded:$e");
    }
    return null;
  }
}
