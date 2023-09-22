import 'package:doctor_appointment/controller/controller.dart';
import 'package:doctor_appointment/data/data.dart';
import 'package:doctor_appointment/res/res.dart';
import 'package:doctor_appointment/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BookingConfirmationView extends StatelessWidget {
  BookingConfirmationView({Key? key}) : super(key: key);
  final bookingData =
      Get.arguments['bookingData'] as BookingData? ?? BookingData();
  final updateId = 'booking_confirmation_view';
  final controller = Get.find<BookingConfirmationController>();

  @override
  Widget build(BuildContext context) =>
      GetBuilder<BookingConfirmationController>(
        id: updateId,
        initState: (_) {
          controller.getBookingConfirmation(
              isLoading: true, updateId: updateId);
        },
        builder: (context) => Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBarWidget(
            title: TranslationUtil.confirmation,
          ),
          bottomNavigationBar: Container(
            margin:
                Dimens.edgeInsets(top: Dimens.twenty, bottom: Dimens.thirty),
            padding: Dimens.edgeInsets(
              top: Dimens.thirty,
              right: Dimens.ten,
              left: Dimens.ten,
              bottom: Dimens.ten,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.1)),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimens.twenty),
                  topRight: Radius.circular(Dimens.twenty),
                )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  title: TranslationUtil.viewAppointment,
                  color: Colors.indigo,
                  onPress: () {
                    RouteManagement.goToMyBookings(bookingData: bookingData);
                  },
                ),
                Dimens.boxHeight(Dimens.ten),
                CustomButton(
                  title: TranslationUtil.bookAnother,
                  color: Colors.white,
                  textColor: Colors.blue,
                  borderColor: Colors.grey,
                  onPress: () {
                    RouteManagement.goToDoctorDetails();
                  },
                ),
              ],
            ),
          ),
          body: controller.bookingConfirmationResponse == null
              ? Utility.showProgressBar()
              : Container(
                  width: Get.width,
                  padding: Dimens.edgeInsetsAll(Dimens.twenty),
                  height: Get.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Dimens.boxHeight(Dimens.fifty),
                      Container(
                        padding: Dimens.edgeInsetsAll(Dimens.thirty),
                        decoration: const BoxDecoration(
                          color: Colors.indigoAccent,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          AssetConstants.tickIcon,
                          width: Dimens.fifty,
                          height: Dimens.fifty,
                        ),
                      ),
                      Dimens.boxHeight(Dimens.ten),
                      Text(
                        TranslationUtil.appointmentConfirmed,
                        style: Styles.black16.copyWith(
                          fontSize: Dimens.eighteen,
                        ),
                      ),
                      Dimens.boxHeight(Dimens.ten),
                      Text(
                        TranslationUtil.appointmentSuccessfullyBooked,
                        style: Styles.black16.copyWith(
                            fontSize: Dimens.twelve, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      Dimens.boxHeight(Dimens.three),
                      Text(
                        controller.bookingConfirmationResponse?.doctorName ??
                            '',
                        style: Styles.black16.copyWith(
                          fontSize: Dimens.fourteen,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Dimens.boxHeight(Dimens.ten),
                      const Divider(),
                      Dimens.boxHeight(Dimens.ten),
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.blueAccent,
                          ),
                          Dimens.boxWidth(Dimens.five),
                          Text(
                            'Asjad Ibrahim',
                            style: Styles.black16.copyWith(
                                fontSize: Dimens.fourteen,
                                color: Colors.blueAccent),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Dimens.boxHeight(Dimens.twenty),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: Colors.blueAccent,
                              ),
                              Dimens.boxWidth(Dimens.five),
                              Text(
                                '${controller.bookingConfirmationResponse?.appointmentDate?.day} ${Utility.getMonthName(controller.bookingConfirmationResponse?.appointmentDate?.month ?? 0)}, ${controller.bookingConfirmationResponse?.appointmentDate?.year}',
                                style: Styles.black16.copyWith(
                                    fontSize: Dimens.fourteen,
                                    color: Colors.blueAccent),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Dimens.boxWidth(Dimens.twenty),
                          Row(
                            children: [
                              const Icon(
                                Icons.watch_later_outlined,
                                color: Colors.blueAccent,
                              ),
                              Dimens.boxWidth(Dimens.five),
                              Text(
                                controller.bookingConfirmationResponse
                                        ?.appointmentTime ??
                                    '',
                                style: Styles.black16.copyWith(
                                    fontSize: Dimens.fourteen,
                                    color: Colors.blueAccent),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
        ),
      );
}
