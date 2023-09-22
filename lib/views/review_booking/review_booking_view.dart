import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_appointment/controller/controller.dart';
import 'package:doctor_appointment/data/data.dart';
import 'package:doctor_appointment/res/res.dart';
import 'package:doctor_appointment/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReviewBookingView extends StatelessWidget {
  ReviewBookingView({Key? key}) : super(key: key);

  var bookingData =
      Get.arguments['bookingData'] as BookingData? ?? BookingData();
  final updateId = 'review_booking_view';
  final controller = Get.find<ReviewBookingController>();

  @override
  Widget build(BuildContext context) => GetBuilder<ReviewBookingController>(
        id: updateId,
        initState: (_) {},
        builder: (context) => Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBarWidget(
            title: TranslationUtil.reviewSummary,
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
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  title: TranslationUtil.confirm,
                  color: Colors.indigo,
                  onPress: () {
                    RouteManagement.goToBookingConfirmation(
                      bookingData: bookingData,
                    );
                  },
                ),
                Dimens.boxHeight(Dimens.ten),
                CustomButton(
                  title: TranslationUtil.edit,
                  color: Colors.white,
                  textColor: Colors.blue,
                  borderColor: Colors.grey,
                  onPress: () {
                    Get.back<void>();
                    Get.back<void>();
                  },
                ),
              ],
            ),
          ),
          body: Container(
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
                            imageUrl: bookingData.image ?? '',
                            height: Dimens.sixty,
                            width: Dimens.sixty,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(Dimens.hundred),
                                child: Icon(
                                  Icons.person,
                                  size: Dimens.sixty,
                                )),
                            errorWidget: (context, url, dynamic error) =>
                                ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.hundred),
                                    child: Icon(
                                      Icons.person,
                                      size: Dimens.sixty,
                                    )),
                          ),
                        ),
                        Positioned(
                          bottom: 1,
                          right: 1,
                          child: Material(
                            borderRadius:
                                BorderRadius.all(Radius.circular(Dimens.fifty)),
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
                          bookingData.doctorName ?? '',
                          style: Styles.black16,
                        ),
                        Dimens.boxHeight(Dimens.five),
                        Text(
                          bookingData.speciality ?? '',
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
                              bookingData.location ?? '',
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TranslationUtil.dateAndHour,
                          style: Styles.black16.copyWith(
                              color: Colors.grey, fontSize: Dimens.fourteen),
                        ),
                        Text(
                          '${Utility.getDesiredFormattedDate(bookingData.bookingDate ?? DateTime.now(), DateFormat('MMMM dd, yyyy'))} | ${bookingData.bookingTime ?? ''}',
                          style: Styles.black16
                              .copyWith(fontSize: Dimens.fourteen),
                        ),
                      ],
                    ),
                    Dimens.boxHeight(Dimens.twenty),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TranslationUtil.package,
                          style: Styles.black16.copyWith(
                              color: Colors.grey, fontSize: Dimens.fourteen),
                        ),
                        Text(
                          bookingData.package ?? '',
                          style: Styles.black16
                              .copyWith(fontSize: Dimens.fourteen),
                        ),
                      ],
                    ),
                    Dimens.boxHeight(Dimens.twenty),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TranslationUtil.duration,
                          style: Styles.black16.copyWith(
                              color: Colors.grey, fontSize: Dimens.fourteen),
                        ),
                        Text(
                          bookingData.duration ?? '',
                          style: Styles.black16
                              .copyWith(fontSize: Dimens.fourteen),
                        ),
                      ],
                    ),
                    Dimens.boxHeight(Dimens.twenty),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TranslationUtil.bookingFor,
                          style: Styles.black16.copyWith(
                              color: Colors.grey, fontSize: Dimens.fourteen),
                        ),
                        Text(
                          'Self',
                          style: Styles.black16
                              .copyWith(fontSize: Dimens.fourteen),
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
