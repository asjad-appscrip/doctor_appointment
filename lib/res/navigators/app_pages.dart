// coverage:ignore-file
import 'package:doctor_appointment/controller/controller.dart';
import 'package:doctor_appointment/views/view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const transitionDuration = Duration(milliseconds: 250);

  static const initial = Routes.splash;

  static const transition = Transition.fadeIn;

  static final pages = [
    GetPage<SplashView>(
      name: _Paths.splash,
      transitionDuration: transitionDuration,
      page: SplashView.new,
      binding: SplashBinding(),
      transition: transition,
    ),
    GetPage<DoctorDetailsView>(
      name: _Paths.doctorDetails,
      transitionDuration: transitionDuration,
      page: DoctorDetailsView.new,
      binding: DoctorDetailsBinding(),
      transition: transition,
    ),
    GetPage<SelectPackageView>(
      name: _Paths.selectPackage,
      transitionDuration: transitionDuration,
      page: SelectPackageView.new,
      binding: SelectPackageBinding(),
      transition: transition,
    ),
    GetPage<ReviewBookingView>(
      name: _Paths.reviewBooking,
      transitionDuration: transitionDuration,
      page: ReviewBookingView.new,
      binding: ReviewBookingBinding(),
      transition: transition,
    ),
    GetPage<BookingConfirmationView>(
      name: _Paths.bookingConfirmation,
      transitionDuration: transitionDuration,
      page: BookingConfirmationView.new,
      binding: BookingConfirmationBinding(),
      transition: transition,
    ),
    GetPage<MyBookingsView>(
      name: _Paths.myBookings,
      transitionDuration: transitionDuration,
      page: MyBookingsView.new,
      binding: MyBookingsBinding(),
      transition: transition,
    ),
  ];
}
