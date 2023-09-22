// To parse this JSON data, do
//
//     final bookingConfirmationResponse = bookingConfirmationResponseFromJson(jsonString);

import 'dart:convert';

BookingConfirmationResponse bookingConfirmationResponseFromJson(String str) => BookingConfirmationResponse.fromJson(json.decode(str));

String bookingConfirmationResponseToJson(BookingConfirmationResponse data) => json.encode(data.toJson());

class BookingConfirmationResponse {
  String? doctorName;
  DateTime? appointmentDate;
  String? appointmentTime;
  String? location;
  String? appointmentPackage;

  BookingConfirmationResponse({
    this.doctorName,
    this.appointmentDate,
    this.appointmentTime,
    this.location,
    this.appointmentPackage,
  });

  factory BookingConfirmationResponse.fromJson(Map<String, dynamic> json) => BookingConfirmationResponse(
    doctorName: json["doctor_name"],
    appointmentDate: DateTime.parse(json["appointment_date"]),
    appointmentTime: json["appointment_time"],
    location: json["location"],
    appointmentPackage: json["appointment_package"],
  );

  Map<String, dynamic> toJson() => {
    "doctor_name": doctorName,
    "appointment_date": "${appointmentDate?.year.toString().padLeft(4, '0')}-${appointmentDate?.month.toString().padLeft(2, '0')}-${appointmentDate?.day.toString().padLeft(2, '0')}",
    "appointment_time": appointmentTime,
    "location": location,
    "appointment_package": appointmentPackage,
  };
}
