// coverage:ignore-file
part of 'app_pages.dart';

/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class Routes {
  static const splash = _Paths.splash;
  static const doctorDetails = _Paths.doctorDetails;
  static const selectPackage = _Paths.selectPackage;
  static const reviewBooking = _Paths.reviewBooking;
  static const bookingConfirmation = _Paths.bookingConfirmation;
  static const myBookings = _Paths.myBookings;
}

abstract class _Paths {
  static const splash = '/splash-screen';
  static const doctorDetails = '/doctor_details_screen';
  static const selectPackage = '/select_package_screen';
  static const reviewBooking = '/review_booking_screen';
  static const bookingConfirmation = '/booking_confirmation_screen';
  static const myBookings = '/my_bookings_screen';
}
