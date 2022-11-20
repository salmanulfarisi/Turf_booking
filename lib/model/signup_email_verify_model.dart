class SignupEmailVerifyModel {
  String? userOtp;
  String? id;
  bool? status;
  String? message;
  SignupEmailVerifyModel({
    this.userOtp,
    this.id,
    this.status,
    this.message,
  });

  factory SignupEmailVerifyModel.fromJson(Map<String, dynamic> json) {
    return SignupEmailVerifyModel(
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "user_otp": userOtp,
      "_id": id,
    };
  }
}
