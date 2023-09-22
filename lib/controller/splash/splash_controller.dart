import 'package:doctor_appointment/res/navigators/navigators.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  void onInit() async {
    await startInit();
    super.onInit();
  }

  Future<void> startInit() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    RouteManagement.goToDoctorDetails();
  }
}
