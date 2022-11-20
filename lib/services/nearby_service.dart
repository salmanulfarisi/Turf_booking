import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:turf_booking/model/model.dart';
import 'package:turf_booking/utils/utils.dart';

class NearbyService {
  NearbyService._instance();
  static final NearbyService instance = NearbyService._instance();
  factory NearbyService() {
    return instance;
  }
  ErrorCode errorCode = ErrorCode();

  Future<HomeResponse?> nearbyTurf(String place, String token) async {
    try {
      Response response = await Dio().get(Url.baseUrl + Url.nearbyUrl + place,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        getx.Get.snackbar("Success", "Login Success");
        return HomeResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      return errorCode.status401(e);
    } catch (e) {
      getx.Get.snackbar("Error", "Error Founded");
    }
    return null;
  }
}
