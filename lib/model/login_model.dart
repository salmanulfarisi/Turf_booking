class LoginModel {
  String? userMail;
  String? userPassword;

  LoginModel({
    required this.userMail,
    required this.userPassword,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      userMail: json['user_mail'],
      userPassword: json['user_password'],
    );
  }
  Map<String, dynamic> toJoson() => {
        'user_mail': userMail,
        'user_password': userPassword,
      };
}

class LoginRespoModel {
  LoginRespoModel({
    this.status,
    this.message,
    this.token,
    this.error,
    this.refreshToken,
  });
  bool? error;
  bool? status;
  String? message;
  String? token;
  String? refreshToken;

  factory LoginRespoModel.fromJson(Map<String, dynamic> json) =>
      LoginRespoModel(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        error: json["error"] ?? true,
        refreshToken: json["refreshToken"],
      );
}
