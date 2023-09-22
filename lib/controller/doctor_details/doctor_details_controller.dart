import 'package:doctor_appointment/data/data.dart';
import 'package:doctor_appointment/viewmodel/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/utility.dart';

class DoctorDetailsController extends GetxController {
  DoctorDetailsController(this.doctorDetailsViewModel);

  final DoctorDetailsViewModel doctorDetailsViewModel;

  var listOfDoctors = <DoctorDetailsResponse>[];
  var listOfDates = <DateTime>[];
  var listOfTimeSlots = <String>[];
  DoctorDetailsResponse? doctorData ;

  Future<void> getDoctorDetails({
    required bool isLoading,
    required String updateId,
  }) async {
    var response =
        await doctorDetailsViewModel.getDoctorDetails(isLoading: true);
    if (response != null) {
      listOfDoctors = response;
      doctorData = response.first;
      update([updateId]);
    }
  }

  void getDateList(String updateId) {
    listOfDates = Utility.getNextDaysDate(5);
    update([updateId]);
  }


  void getTimeSlots(String updateId) {
    listOfTimeSlots = Utility.getTimeSlots(const TimeOfDay(hour: 9, minute: 30), const TimeOfDay(hour: 12, minute: 0), 30);
    update([updateId]);
  }
}
