import 'package:doctor_appointment/data/data.dart';

class MyBookingsRepository {
  MyBookingsRepository(this._dataSource);

  final DataSource _dataSource;

  Future<ResponseModel> getMyBookings({
    required bool isLoading,
  }) async {
    return await _dataSource
        .getNetworkManager()
        .apiHandler()
        .getMyBookings();
  }
}
