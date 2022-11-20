import 'package:turf_booking/model/nearby_model/nearby_model.dart';

class Datum {
  Datum({
    this.turfCategory,
    this.turfType,
    this.turfInfo,
    this.turfAmenities,
    this.turfImages,
    this.turfTime,
    this.id,
    this.turfCreatorId,
    this.turfName,
    this.turfPlace,
    this.turfMunicipality,
    this.turfDistrict,
    this.turfPrice,
    this.turfLogo,
    this.v,
  });

  TurfCategory? turfCategory;
  TurfType? turfType;
  TurfInfo? turfInfo;
  TurfAmenities? turfAmenities;
  TurfImages? turfImages;
  TurfTime? turfTime;
  String? id;
  String? turfCreatorId;
  String? turfName;
  String? turfPlace;
  String? turfMunicipality;
  String? turfDistrict;
  TurfPrice? turfPrice;
  String? turfLogo;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        turfCategory: TurfCategory.fromJson(json["turf_category"]),
        turfType: TurfType.fromJson(json["turf_type"]),
        turfInfo: TurfInfo.fromJson(json["turf_info"]),
        turfAmenities: TurfAmenities.fromJson(json["turf_amenities"]),
        turfImages: TurfImages.fromJson(json["turf_images"]),
        turfTime: TurfTime.fromJson(json["turf_time"]),
        id: json["_id"],
        turfCreatorId: json["turf_creator_id"],
        turfName: json["turf_name"],
        turfPlace: json["turf_place"],
        turfMunicipality: json["turf_municipality"],
        turfDistrict: json["turf_district"],
        turfPrice: TurfPrice.fromJson(json["turf_price"]),
        turfLogo: json["turf_logo"],
        v: json["__v"],
      );
}
