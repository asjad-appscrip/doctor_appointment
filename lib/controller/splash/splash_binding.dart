import 'package:doctor_appointment/controller/controller.dart';
import 'package:get/get.dart';

/// A list of bindings which will be used in the route of [SplashView].
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashController(),
    );
  }
}
