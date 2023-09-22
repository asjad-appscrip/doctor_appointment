import 'package:doctor_appointment/data/data.dart';
import 'package:doctor_appointment/domain/domain.dart';
import 'package:doctor_appointment/utility/utils.dart';
import 'package:flutter/cupertino.dart';

class SelectPackageViewModel {
  SelectPackageViewModel(this.selectPackageRepository);

  final SelectPackageRepository selectPackageRepository;

  Future<PackageResponse?> getPackageDetails({
    required bool isLoading,
  }) async {
    try {
      var res = await selectPackageRepository.getPackageDetails(isLoading: true);

      if (res.hasError) {
        Utility.showInfoDialog(data: res);
      } else {
        final data = packageResponseFromJson(res.data);

        /// Precache Code Block Completed Here
        return data;
      }
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      Utility.closeDialog();
    }
    return null;
  }
}
