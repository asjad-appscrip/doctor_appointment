import 'package:doctor_appointment/data/data.dart';
import 'package:doctor_appointment/viewmodel/viewmodel.dart';
import 'package:get/get.dart';

class BookingConfirmationController extends GetxController {

  BookingConfirmationController(this.bookingConfirmationViewModel);

  final BookingConfirmationViewModel bookingConfirmationViewModel;
  BookingConfirmationResponse? bookingConfirmationResponse;

  Future<void> getBookingConfirmation({
    required bool isLoading,
    required String updateId,
  }) async {
    var response =
        await bookingConfirmationViewModel.getBookingConfirmation(isLoading: true);
    if (response != null) {
      bookingConfirmationResponse = response;
      update([updateId]);
    }
  }
}
