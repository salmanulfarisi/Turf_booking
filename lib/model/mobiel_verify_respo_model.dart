class MobileVerificationResponseModel {
  String? id;
  String? otp;
  bool? status;
  String? number;

  MobileVerificationResponseModel({
    this.otp,
    this.id,
    this.status,
    this.number,
  });

  factory MobileVerificationResponseModel.fromJson(Map<String, dynamic> json) {
    return MobileVerificationResponseModel(
      id: json['jwt'],
      status: json['status'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'user_otp': otp,
      '_id': id,
      'user_number': number,
    };
  }
}
