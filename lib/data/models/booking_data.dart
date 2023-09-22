import 'package:doctor_appointment/data/data.dart';

class BookingData {
  BookingData({
    this.doctorName,
    this.image,
    this.speciality,
    this.location,
    this.bookingDate,
    this.bookingTime,
    this.package,
    this.duration,
    this.listOfDoctors,
  });

  String? doctorName;
  String? image;
  String? speciality;
  String? location;
  DateTime? bookingDate;
  String? bookingTime;
  String? package;
  String? duration;
  List<DoctorDetailsResponse>? listOfDoctors;
}
