import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_appointment/controller/controller.dart';
import 'package:doctor_appointment/data/data.dart';
import 'package:doctor_appointment/res/res.dart';
import 'package:doctor_appointment/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DoctorDetailsView extends StatelessWidget {
  DoctorDetailsView({Key? key}) : super(key: key);

  final updateId = 'doctor_details_view';
  final controller = Get.find<DoctorDetailsController>();

  var bookingData = BookingData();
  var selectedDayIndex = 0;
  var selectedTimeIndex = 0;

  @override
  Widget build(BuildContext context) => GetBuilder<DoctorDetailsController>(
        id: updateId,
        initState: (_) async {
          await controller.getDoctorDetails(
            isLoading: true,
            updateId: updateId,
          );
          controller.getDateList('day_ui');
          controller.getTimeSlots('time_ui');
          if (controller.doctorData != null) {
            bookingData.doctorName = controller.doctorData?.doctorName ?? '';
            bookingData.location = controller.doctorData?.location ?? '';
            bookingData.speciality = controller.doctorData?.speciality ?? '';
            bookingData.image = controller.doctorData?.image ?? '';
            bookingData.listOfDoctors = controller.listOfDoctors;
            bookingData.bookingDate = controller.listOfDates[selectedDayIndex];
            bookingData.bookingTime =
                controller.listOfTimeSlots[selectedTimeIndex];
          }
        },
        builder: (context) => Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBarWidget(
            title: TranslationUtil.bookAppointment,
          ),
          bottomNavigationBar: Container(
            margin:
                Dimens.edgeInsets(top: Dimens.twenty, bottom: Dimens.thirty),
            padding: Dimens.edgeInsets(
              top: Dimens.thirty,
              right: Dimens.ten,
              left: Dimens.ten,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.1)),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimens.twenty),
                  topRight: Radius.circular(Dimens.twenty),
                )),
            child: CustomButton(
              title: TranslationUtil.makeAppointment,
              color: Colors.indigo,
              onPress: () {
                RouteManagement.goToSelectPackage(bookingData: bookingData);
              },
            ),
          ),
          body: controller.doctorData == null
              ? Utility.showProgressBar()
              : Container(
                  padding: Dimens.edgeInsetsAll(Dimens.twenty),
                  height: Get.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  Dimens.fiftyFive,
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: controller.doctorData?.image ?? '',
                                  height: Dimens.sixty,
                                  width: Dimens.sixty,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.hundred),
                                    child: Icon(
                                      Icons.person,
                                      size: Dimens.sixty,
                                    ),
                                  ),
                                  errorWidget: (context, url, dynamic error) =>
                                      ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.hundred),
                                    child: Icon(
                                      Icons.person,
                                      size: Dimens.sixty,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 1,
                                right: 1,
                                child: Material(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimens.fifty)),
                                  color: Colors.transparent,
                                  elevation: Dimens.ten,
                                  child: Container(
                                    padding: Dimens.edgeInsetsAll(Dimens.two),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: Dimens.three,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AssetConstants.verifiedSVG,
                                        height: Dimens.twenty,
                                        width: Dimens.twenty,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Dimens.boxWidth(Dimens.fifteen),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.doctorData?.doctorName ?? '',
                                style: Styles.black16,
                              ),
                              Dimens.boxHeight(Dimens.five),
                              Text(
                                controller.doctorData?.speciality ?? '',
                                style: Styles.black16.copyWith(
                                    fontSize: Dimens.twelve,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              Dimens.boxHeight(Dimens.five),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    AssetConstants.locationSvg,
                                    color: Colors.blue,
                                  ),
                                  Dimens.boxWidth(Dimens.three),
                                  Text(
                                    controller.doctorData?.location ?? '',
                                    style: Styles.black16.copyWith(
                                        fontSize: Dimens.twelve,
                                        color: Colors.blue.withOpacity(0.7)),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      Dimens.boxHeight(Dimens.twenty),
                      Divider(
                        thickness: Dimens.pointFive,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Dimens.boxHeight(Dimens.twenty),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getRoundWidget(
                            '${controller.doctorData?.patientsServed ?? 0}',
                            TranslationUtil.patients,
                            Icons.person,
                          ),
                          getRoundWidget(
                            '${controller.doctorData?.yearsOfExperience ?? 0}',
                            TranslationUtil.yearsExp,
                            Icons.cases_outlined,
                          ),
                          getRoundWidget(
                            '${controller.doctorData?.rating ?? 0}',
                            TranslationUtil.rating,
                            Icons.star_outline,
                          ),
                          getRoundWidget(
                            '${controller.doctorData?.numberOfReviews ?? 0}',
                            TranslationUtil.review,
                            Icons.rate_review_outlined,
                          ),
                        ],
                      ),
                      Dimens.boxHeight(Dimens.fourty),
                      Text(
                        TranslationUtil.bookAppointment.toUpperCase(),
                        style: Styles.black16.copyWith(
                          color: Colors.grey,
                          fontSize: Dimens.fourteen,
                        ),
                      ),
                      Dimens.boxHeight(Dimens.twenty),
                      Text(
                        TranslationUtil.day,
                        style: Styles.black16.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                      Dimens.boxHeight(Dimens.ten),
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                                controller.listOfDates.length,
                                (index) => getDayUI(
                                      controller.listOfDates[index],
                                      index,
                                    )),
                          ),
                        ),
                      ),
                      Dimens.boxHeight(Dimens.twenty),
                      Text(
                        TranslationUtil.time,
                        style: Styles.black16.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                      Dimens.boxHeight(Dimens.ten),
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                                controller.listOfTimeSlots.length,
                                (index) => getTimeUI(
                                      controller.listOfTimeSlots[index],
                                      index,
                                    )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      );

  Widget getRoundWidget(
      String firstText, String secondText, IconData iconData) {
    return Column(
      children: [
        Container(
          padding: Dimens.edgeInsetsAll(Dimens.ten),
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black12)),
          child: Icon(
            iconData,
            size: Dimens.thirty,
            color: Colors.blue,
          ),
        ),
        Dimens.boxHeight(Dimens.five),
        Text(
          firstText,
          style: Styles.black16.copyWith(
            color: Colors.blue,
          ),
        ),
        Dimens.boxHeight(Dimens.five),
        Text(
          secondText,
          style: Styles.black16.copyWith(
            color: Colors.grey,
            fontSize: Dimens.fourteen,
          ),
        ),
      ],
    );
  }

  Widget getDayUI(DateTime date, int index) {
    return GetBuilder<DoctorDetailsController>(
        id: 'day_ui',
        builder: (context) {
          return InkWell(
            onTap: () {
              selectedDayIndex = index;
              controller.update([updateId]);
            },
            child: Container(
              margin: Dimens.edgeInsets(
                left: Dimens.five,
                right: Dimens.five,
              ),
              padding: Dimens.edgeInsetsSymmetric(
                vertical: Dimens.seven,
                horizontal: Dimens.twenty,
              ),
              decoration: BoxDecoration(
                color: selectedDayIndex == index
                    ? Colors.indigoAccent
                    : Colors.white,
                borderRadius: BorderRadius.circular(Dimens.hundredSeventy),
                border: Border.all(
                    color: selectedDayIndex == index
                        ? Colors.transparent
                        : Colors.grey.withOpacity(0.2)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Utility.getFormattedDate(date),
                    style: Styles.white16.copyWith(
                      color: selectedDayIndex == index
                          ? Colors.white
                          : Colors.indigoAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget getTimeUI(String timeSlot, int index) {
    return GetBuilder<DoctorDetailsController>(
        id: 'time_ui',
        builder: (context) {
          return InkWell(
            onTap: () {
              selectedTimeIndex = index;
              controller.update([updateId]);
            },
            child: Container(
              margin: Dimens.edgeInsets(
                left: Dimens.five,
                right: Dimens.five,
              ),
              padding: Dimens.edgeInsetsSymmetric(
                vertical: Dimens.ten,
                horizontal: Dimens.twenty,
              ),
              decoration: BoxDecoration(
                color: selectedTimeIndex == index
                    ? Colors.indigoAccent
                    : Colors.white,
                borderRadius: BorderRadius.circular(Dimens.hundredSeventy),
                border: Border.all(
                    color: selectedTimeIndex == index
                        ? Colors.transparent
                        : Colors.grey.withOpacity(0.2)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    timeSlot,
                    style: Styles.white16.copyWith(
                      color: selectedTimeIndex == index
                          ? Colors.white
                          : Colors.indigoAccent,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
