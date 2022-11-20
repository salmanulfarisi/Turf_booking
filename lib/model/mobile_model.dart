class MobileNumberRespoModel {
  String? id;
  String? number;
  bool? status;
  MobileNumberRespoModel({this.number, this.status, this.id});

  factory MobileNumberRespoModel.fromJson(Map<String, dynamic> json) {
    return MobileNumberRespoModel(
      id: json['_id'],
      status: json['status'],
      number: json['user_number'],
    );
  }

  Map<String, dynamic> tojson() => {
        "user_number": number,
      };
}
