import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf_booking/model/nearby_model/nearby_model.dart';
import 'package:turf_booking/utils/utils.dart';

class AllTurfService {
  AllTurfService._instans();
  static AllTurfService instance = AllTurfService._instans();
  factory AllTurfService() {
    return instance;
  }
  ErrorCode errorCode = ErrorCode();
  Future<HomeResponse?> allTurf(String token) async {
    try {
      Response response = await Dio().get(
        Url.baseUrl + Url.allTurfUrl,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return HomeResponse.fromJson(response.data);
    } on DioError catch (e) {
      return errorCode.status401(e);
    } catch (e) {
      const SnackBar(
        content: Text('Error Founded'),
        backgroundColor: Color.fromARGB(255, 47, 48, 47),
      );
    }
    return null;
  }
}
