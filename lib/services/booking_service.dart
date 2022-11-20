import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf_booking/model/model.dart';
import 'package:turf_booking/utils/utils.dart';

class BookingService {
  BookingService._instans();
  static BookingService instance = BookingService._instans();
  factory BookingService() {
    return instance;
  }
  ErrorCode errorCode = ErrorCode();
  Future<GetAllTurfTimeSlot?> book(String turfId) async {
    try {
      Response response =
          await Dio().get(Url.baseUrl + Url.getBookingUrl + turfId);
      if (response.statusCode == 200) {
        // print(response.data);
        const SnackBar(
          content: Text("Login successfully"),
          backgroundColor: Color.fromARGB(255, 97, 98, 97),
        );
        return GetAllTurfTimeSlot.fromJson(response.data);
      }
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
