import 'package:doctor_appointment/data/data.dart';
import 'package:doctor_appointment/domain/domain.dart';
import 'package:doctor_appointment/utility/utils.dart';
import 'package:flutter/cupertino.dart';

class BookingConfirmationViewModel {
  BookingConfirmationViewModel(this.detailsRepository);

  final BookingConfirmationRepository detailsRepository;

  Future<BookingConfirmationResponse?> getBookingConfirmation({
    required bool isLoading,
  }) async {
    try {
      var res = await detailsRepository.getBookingConfirmation(isLoading: true);

      if (res.hasError) {
        Utility.showInfoDialog(data: res);
      } else {
        final data = bookingConfirmationResponseFromJson(res.data);

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
