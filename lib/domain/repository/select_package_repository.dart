import 'package:doctor_appointment/data/data.dart';

class SelectPackageRepository {
  SelectPackageRepository(this._dataSource);

  final DataSource _dataSource;

  /// GET API Method to Get package details
  Future<ResponseModel> getPackageDetails({
    required bool isLoading,
  }) async {
    return await _dataSource
        .getNetworkManager()
        .apiHandler()
        .getPackageDetails();
  }
}
