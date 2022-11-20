class SignupModel {
  final String userMail;
  final String userPassword;
  SignupModel({
    required this.userMail,
    required this.userPassword,
  });

  Map<String, dynamic> toJson() => {
        "user_mail": userMail,
        "user_password": userPassword,
      };
}

class SignupResponseModel {
  bool? status;
  String? id;
  String? message;
  SignupResponseModel({
    this.status,
    this.id,
    this.message,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      SignupResponseModel(
        status: json["status"] ?? false,
        id: json["id"],
        message: json["message"],
      );
}
