import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:turf_booking/model/model.dart';
import 'package:turf_booking/utils/utils.dart';

class LoginService {
  LoginService._instance();
  static final LoginService instance = LoginService._instance();
  factory LoginService() {
    return instance;
  }
  ErrorCode errorCode = ErrorCode();
  Future<LoginRespoModel?> userLogin(LoginModel value, context) async {
    try {
      Response response =
          await Dio().post(Url.baseUrl + Url.loginUrl, data: value.toJoson());
      if (response.statusCode == 200) {
        getx.Get.snackbar("Success", "Login Successfully");
        return LoginRespoModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      return errorCode.status401(e);
    } catch (e) {
      getx.Get.snackbar("Error", "Error Founded:&e");
    }
    return null;
  }
}
