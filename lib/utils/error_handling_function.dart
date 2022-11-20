import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorCode {
  status401(e) {
    if (e.response?.statusCode == 401) {
      Get.snackbar('Error', '401 Unauthorized',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } else if (e.response?.statusCode == 404) {
      Get.snackbar('Error', 'User already exists',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } else if (e.type == DioErrorType.connectTimeout) {
      Get.snackbar('Connection Time Out', 'Please try again',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } else if (e.type == DioErrorType.receiveTimeout) {
      Get.snackbar('TimeOut Erroe', 'Please try again',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } else if (e.type == DioErrorType.other) {
      Get.snackbar('NetWork Error', 'Please try again',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
