import 'package:doctor_appointment/data/models/booking_data.dart';
import 'package:doctor_appointment/data/models/view_booking_response.dart';
import 'package:doctor_appointment/viewmodel/viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyBookingsController extends GetxController {
  MyBookingsController(this.myBookingViewModel);

  final MyBookingsViewModel myBookingViewModel;

  var bookingsList = <ViewBookingsResponse>[];

  Future<void> getMyBookings({
    required bool isLoading,
    required String updateId,
  }) async {
    var response = await myBookingViewModel.getMyBookings(isLoading: true);
    if (response != null) {
      bookingsList = response;
      update([updateId]);
    }
  }

  void setDoctorProfileImages(BookingData bookingData, String updateId) {
    if (bookingsList.isNotEmpty &&
        bookingData.listOfDoctors?.isNotEmpty == true) {
      for (var booking in bookingsList) {
        for (var doctor in bookingData.listOfDoctors!) {
          if(booking.doctorName == doctor.doctorName) {
            booking.doctorProfileImage = doctor.image;
            debugPrint('doctorProfileImage: ${booking.doctorProfileImage}');
          }
        }
      }
    }
    update([updateId]);
  }
}
