import 'package:doctor_appointment/data/data.dart';

class DoctorDetailsRepository {
  DoctorDetailsRepository(this._dataSource);

  final DataSource _dataSource;

  /// GET API Method to Get doctor details
  Future<ResponseModel> getDoctorDetails({
    required bool isLoading,
  }) async {
    return await _dataSource
        .getNetworkManager()
        .apiHandler()
        .getDoctorDetails();
  }
}
