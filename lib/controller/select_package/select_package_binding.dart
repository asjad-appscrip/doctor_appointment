import 'package:doctor_appointment/controller/controller.dart';
import 'package:doctor_appointment/data/data.dart';
import 'package:doctor_appointment/domain/domain.dart';
import 'package:doctor_appointment/viewmodel/viewmodel.dart';
import 'package:doctor_appointment/views/select_package/select_package.dart';
import 'package:get/get.dart';

/// A list of bindings which will be used in the route of [SelectPackageView].
class SelectPackageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SelectPackageController(
          SelectPackageViewModel(SelectPackageRepository(DataSourceImpl()))),
    );
  }
}
