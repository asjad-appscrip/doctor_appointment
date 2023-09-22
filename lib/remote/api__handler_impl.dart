import 'package:doctor_appointment/data/models/response_model.dart';
import 'package:doctor_appointment/remote/api_wrapper.dart';
import 'package:doctor_appointment/remote/remote.dart';
import 'package:doctor_appointment/res/res.dart';

class ApiHandlerImplementation extends ApiHandler {
  ApiHandlerImplementation({
    required this.apiWrapper,
  });

  /// Device Info Instance
  final ApiWrapper apiWrapper;

  @override
  Future<ResponseModel> getDoctorDetails() async {
    return await apiWrapper.makeRequest(
      'https://my-json-server.typicode.com/githubforekam/doctor-appointment/doctors',
      Request.get,
      null,
      true,
      {},
    );
  }

  @override
  Future<ResponseModel> getPackageDetails() async {
    return await apiWrapper.makeRequest(
      'https://my-json-server.typicode.com/githubforekam/doctor-appointment/appointment_options',
      Request.get,
      null,
      true,
      {},
    );
  }

  @override
  Future<ResponseModel> getBookingConfirmation() async {
    return await apiWrapper.makeRequest(
      'https://my-json-server.typicode.com/githubforekam/doctor-appointment/booking_confirmation',
      Request.get,
      null,
      true,
      {},
    );
  }

  @override
  Future<ResponseModel> getMyBookings() async {
    return await apiWrapper.makeRequest(
      'https://my-json-server.typicode.com/githubforekam/doctor-appointment/appointments',
      Request.get,
      null,
      true,
      {},
    );
  }
}
