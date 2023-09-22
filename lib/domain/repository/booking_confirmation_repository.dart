import 'package:doctor_appointment/data/data.dart';

class BookingConfirmationRepository {
  BookingConfirmationRepository(this._dataSource);

  final DataSource _dataSource;

  /// GET API Method to Get booking confirmation
  Future<ResponseModel> getBookingConfirmation({
    required bool isLoading,
  }) async {
    return await _dataSource
        .getNetworkManager()
        .apiHandler()
        .getBookingConfirmation();
  }
}
