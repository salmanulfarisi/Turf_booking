import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf_booking/model/register_model.dart';
import 'package:turf_booking/utils/utils.dart';

class SignupService {
  SignupService._internal();
  static final SignupService _instance = SignupService._internal();
  factory SignupService() => _instance;

  ErrorCode errorCode = ErrorCode();
  Future<SignupResponseModel?> signupUser(SignupModel model, context) async {
    try {
      Response response = await Dio().post(
        Url.baseUrl + Url.registerUrl,
        data: model.toJson(),
      );
      if (response.statusCode == 200) {
        return SignupResponseModel.fromJson(response.data);
      } else {
        log('error');
        return null;
      }
    } on DioError catch (e) {
      log('=======${e.response!.statusCode}====');
      return errorCode.status401(e);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error Founded: $e'),
          backgroundColor: const Color.fromARGB(255, 47, 48, 47),
        ),
      );
    }
    return null;
  }
}
