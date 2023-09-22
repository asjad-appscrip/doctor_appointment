import 'package:doctor_appointment/data/models/view_booking_response.dart';
import 'package:doctor_appointment/domain/domain.dart';
import 'package:doctor_appointment/utility/utils.dart';
import 'package:flutter/cupertino.dart';

class MyBookingsViewModel {
  MyBookingsViewModel(this.myBookingsRepository);

  final MyBookingsRepository myBookingsRepository;

  Future<List<ViewBookingsResponse>?> getMyBookings({
    required bool isLoading,
  }) async {
    try {
      var res = await myBookingsRepository.getMyBookings(isLoading: true);

      if (res.hasError) {
        Utility.showInfoDialog(data: res);
      } else {
        final data = viewBookingsResponseFromJson(res.data);

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
