import 'package:doctor_appointment/data/data.dart';
import 'package:doctor_appointment/viewmodel/viewmodel.dart';
import 'package:get/get.dart';

class SelectPackageController extends GetxController {
  SelectPackageController(this.selectPackageViewModel);

  final SelectPackageViewModel selectPackageViewModel;

  PackageResponse? packageResponse ;

  Future<void> getPackageDetails({
    required bool isLoading,
    required String updateId,
  }) async {
    var response =
    await selectPackageViewModel.getPackageDetails(isLoading: true);
    if (response != null) {
      packageResponse = response;
      update([updateId]);
    }
  }
}
