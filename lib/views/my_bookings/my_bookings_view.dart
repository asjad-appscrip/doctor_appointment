import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_appointment/controller/controller.dart';
import 'package:doctor_appointment/data/data.dart';
import 'package:doctor_appointment/data/models/view_booking_response.dart';
import 'package:doctor_appointment/res/res.dart';
import 'package:doctor_appointment/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyBookingsView extends StatelessWidget {
  MyBookingsView({Key? key}) : super(key: key);
  var bookingData =
      Get.arguments['bookingData'] as BookingData? ?? BookingData();
  final updateId = 'my_bookings_view';
  final controller = Get.find<MyBookingsController>();

  @override
  Widget build(BuildContext context) => GetBuilder<MyBookingsController>(
        id: updateId,
        initState: (_) async {
          await controller.getMyBookings(isLoading: true, updateId: updateId);
          controller.setDoctorProfileImages(bookingData, updateId);
        },
        builder: (context) => Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBarWidget(
            title: TranslationUtil.myBookings,
          ),
          body: controller.bookingsList.isEmpty
              ? Utility.showProgressBar()
              : Container(
                  padding: Dimens.edgeInsetsAll(Dimens.twenty),
                  height: Get.height,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          controller.bookingsList.length,
                          (index) =>
                              getBookingItem(controller.bookingsList[index])),
                    ),
                  ),
                ),
        ),
      );

  Widget getBookingItem(ViewBookingsResponse bookingsResponse) {
    return Container(
      width: Get.width,
      margin: Dimens.edgeInsets(bottom: Dimens.ten),
      padding: Dimens.edgeInsetsAll(Dimens.fifteen),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.ten),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bookingsResponse.appointmentTime ?? '',
            style: Styles.blackBold16.copyWith(
              color: Colors.black.withOpacity(0.7),
              fontSize: Dimens.fourteen,
            ),
          ),
          Dimens.boxHeight(Dimens.five),
          const Divider(),
          Dimens.boxHeight(Dimens.five),
          Row(
            children: [
              Container(
                height: Dimens.ninty,
                width: Dimens.ninty,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.five),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black12.withOpacity(0.1),
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: bookingsResponse.doctorProfileImage ?? '',
                  height: Dimens.ninty,
                  width: Dimens.ninty,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.hundred),
                    child: Icon(
                      Icons.person,
                      size: Dimens.ninty,
                    ),
                  ),
                  errorWidget: (context, url, dynamic error) => ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.hundred),
                    child: Icon(
                      Icons.person,
                      size: Dimens.ninty,
                    ),
                  ),
                ),
              ),
              Dimens.boxWidth(Dimens.eight),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    bookingsResponse.doctorName ?? '',
                    style: Styles.blackBold16.copyWith(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: Dimens.twelve,
                    ),
                  ),
                  Dimens.boxHeight(Dimens.five),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AssetConstants.locationSvg,
                        color: Colors.blue,
                      ),
                      Dimens.boxWidth(Dimens.three),
                      Text(
                        bookingsResponse.location ?? '',
                        style: Styles.black16.copyWith(
                          fontSize: Dimens.twelve,
                          color: Colors.blue.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight(Dimens.five),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.book_online_sharp,
                        color: Colors.blue.withOpacity(0.7),
                      ),
                      Dimens.boxWidth(Dimens.three),
                      Text(
                        '${TranslationUtil.bookingId}: ${bookingsResponse.bookingId}',
                        style: Styles.black16.copyWith(
                          fontSize: Dimens.twelve,
                          color: Colors.blue.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Dimens.boxHeight(Dimens.twenty),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 1,
                child: Material(
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.black.withOpacity(0.6),
                    child: Ink(
                      padding: Dimens.edgeInsetsSymmetric(
                        vertical: Dimens.ten,
                        horizontal: Dimens.ten,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(Dimens.twenty),
                      ),
                      child: Center(
                        child: Text(
                          TranslationUtil.cancel,
                          style: Styles.white16.copyWith(
                              color: Colors.blue, fontSize: Dimens.fourteen),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Dimens.boxWidth(Dimens.ten),
              Flexible(
                flex: 1,
                child: Material(
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.black.withOpacity(0.6),
                    child: Ink(
                      padding: Dimens.edgeInsetsSymmetric(
                        vertical: Dimens.ten,
                        horizontal: Dimens.ten,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(Dimens.twenty),
                      ),
                      child: Center(
                        child: Text(
                          TranslationUtil.reschedule,
                          style: Styles.white16
                              .copyWith(fontSize: Dimens.fourteen),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
