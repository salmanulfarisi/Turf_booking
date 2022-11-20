import 'package:turf_booking/model/nearby_model/nearby_model.dart';

class HomeResponse {
  HomeResponse({
    this.status,
    this.data,
  });

  bool? status;
  List<Datum>? data;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}
