import 'package:doctor_appointment/data/data.dart';

abstract class ApiHandler {
  Future<ResponseModel> getDoctorDetails();
  Future<ResponseModel> getPackageDetails();
  Future<ResponseModel> getBookingConfirmation();
  Future<ResponseModel> getMyBookings();
}
