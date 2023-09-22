// To parse this JSON data, do
//
//     final viewBookingsResponse = viewBookingsResponseFromJson(jsonString);

import 'dart:convert';

List<ViewBookingsResponse> viewBookingsResponseFromJson(String str) =>
    List<ViewBookingsResponse>.from(
        json.decode(str).map((x) => ViewBookingsResponse.fromJson(x)));

String viewBookingsResponseToJson(List<ViewBookingsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViewBookingsResponse {
  String? bookingId;
  String? doctorName;
  String? location;
  DateTime? appointmentDate;
  String? appointmentTime;
  String? doctorProfileImage;

  ViewBookingsResponse({
    this.bookingId,
    this.doctorName,
    this.location,
    this.appointmentDate,
    this.appointmentTime,
    this.doctorProfileImage,
  });

  factory ViewBookingsResponse.fromJson(Map<String, dynamic> json) =>
      ViewBookingsResponse(
        bookingId: json["booking_id"],
        doctorName: json["doctor_name"],
        location: json["location"],
        appointmentDate: DateTime.parse(json["appointment_date"]),
        appointmentTime: json["appointment_time"],
      );

  Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "doctor_name": doctorName,
        "location": location,
        "appointment_date":
            "${appointmentDate?.year.toString().padLeft(4, '0')}-${appointmentDate?.month.toString().padLeft(2, '0')}-${appointmentDate?.day.toString().padLeft(2, '0')}",
        "appointment_time": appointmentTime,
      };
}
