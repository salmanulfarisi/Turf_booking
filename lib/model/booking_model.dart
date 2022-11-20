class GetAllTurfTimeSlot {
  GetAllTurfTimeSlot({
    this.status,
    this.data,
  });

  bool? status;
  List<BookNowTimeSlot>? data;

  factory GetAllTurfTimeSlot.fromJson(Map<String, dynamic> json) =>
      GetAllTurfTimeSlot(
        status: json["status"],
        data: List<BookNowTimeSlot>.from(
          json["data"].map(
            (x) => BookNowTimeSlot.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(
          data!.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class BookNowTimeSlot {
  BookNowTimeSlot({
    this.id,
    this.bookingDate,
    this.turfId,
    this.timeSlot,
  });

  String? id;
  String? bookingDate;
  String? turfId;
  List<int>? timeSlot;

  factory BookNowTimeSlot.fromJson(Map<String, dynamic> json) =>
      BookNowTimeSlot(
        id: json["_id"],
        bookingDate: json["booking_date"],
        turfId: json["turf_id"],
        timeSlot: List<int>.from(
          json["time_slot"].map((x) => x),
        ),
      );

  Map<String, dynamic> toJson() => {
        "booking_date": bookingDate,
        "turf_id": turfId,
        "time_slot": List<dynamic>.from(
          timeSlot!.map((x) => x),
        ),
      };
}
