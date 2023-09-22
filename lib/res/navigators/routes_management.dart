// coverage:ignore-file

import 'package:doctor_appointment/data/data.dart';
import 'package:doctor_appointment/res/navigators/app_pages.dart';
import 'package:get/get.dart';

abstract class RouteManagement {
  /// Go off to doctor details screen
  static void goToDoctorDetails() {
    Get.offAllNamed<void>(Routes.doctorDetails);
  }

  static void goToSelectPackage({required BookingData bookingData}) {
    Get.toNamed<void>(
      Routes.selectPackage,
      arguments: {'bookingData': bookingData},
    );
  }

  static void goToReviewBooking({required BookingData bookingData}) {
    Get.toNamed<void>(
      Routes.reviewBooking,
      arguments: {'bookingData': bookingData},
    );
  }

  static void goToBookingConfirmation({required BookingData bookingData}) {
    Get.toNamed<void>(
      Routes.bookingConfirmation,
      arguments: {'bookingData': bookingData},
    );
  }

  static void goToMyBookings({required BookingData bookingData}) {
    Get.toNamed<void>(
      Routes.myBookings,
      arguments: {'bookingData': bookingData},
    );
  }
}
