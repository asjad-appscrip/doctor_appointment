import 'package:doctor_appointment/controller/review_booking/review_booking.dart';
import 'package:doctor_appointment/views/review_booking/review_booking.dart';
import 'package:get/get.dart';

/// A list of bindings which will be used in the route of [ReviewBookingView].
class ReviewBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ReviewBookingController(),
    );
  }
}
