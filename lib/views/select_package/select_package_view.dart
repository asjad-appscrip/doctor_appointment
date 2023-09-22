import 'package:doctor_appointment/controller/controller.dart';
import 'package:doctor_appointment/data/data.dart';
import 'package:doctor_appointment/res/res.dart';
import 'package:doctor_appointment/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPackageView extends StatelessWidget {
  SelectPackageView({Key? key}) : super(key: key);

  var bookingData =
      Get.arguments['bookingData'] as BookingData? ?? BookingData();
  final updateId = 'select_package_view';
  final controller = Get.find<SelectPackageController>();
  var currentSelectedDurationIndex = 0;
  var currentSelectedPackageIndex = 0;
  var currentSelectedBooleanValue = false;

  @override
  Widget build(BuildContext context) => GetBuilder<SelectPackageController>(
        id: updateId,
        initState: (_) async {
          await controller.getPackageDetails(
            isLoading: true,
            updateId: updateId,
          );
          if (controller.packageResponse?.duration.isNotEmpty == true) {
            bookingData.duration = controller.packageResponse?.duration.first;
          }
          if (controller.packageResponse?.package.isNotEmpty == true) {
            bookingData.package = controller.packageResponse?.package.first;
          }
        },
        builder: (context) => Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBarWidget(
            title: TranslationUtil.selectPackage,
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
              title: TranslationUtil.next,
              color: Colors.indigo,
              onPress: () {
                RouteManagement.goToReviewBooking(bookingData: bookingData);
              },
            ),
          ),
          body: controller.packageResponse == null
              ? Utility.showProgressBar()
              : Container(
                  padding: Dimens.edgeInsetsAll(Dimens.ten),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TranslationUtil.selectDuration,
                        style: Styles.black16.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                      Dimens.boxHeight(Dimens.ten),
                      Container(
                        padding: Dimens.edgeInsetsSymmetric(
                          vertical: Dimens.eight,
                          horizontal: Dimens.twelve,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimens.ten),
                            border: Border.all(color: Colors.grey)),
                        child: Container(
                          width: Get.width,
                          alignment: Alignment.topRight,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              // Initial Value
                              value: currentSelectedDurationIndex,
                              isExpanded: true,
                              iconEnabledColor: Colors.blueAccent,
                              items: controller.packageResponse?.duration
                                  .map((duration) {
                                return DropdownMenuItem<int>(
                                  value: controller.packageResponse?.duration
                                      .indexOf(duration),
                                  child: Text(
                                    duration,
                                    style: Styles.black16.copyWith(
                                      color: Colors.blue,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValueIndex) {
                                currentSelectedDurationIndex =
                                    newValueIndex ?? 0;
                                var newValue = controller.packageResponse
                                    ?.duration[newValueIndex ?? 0];
                                bookingData.duration = newValue.toString();
                                controller.update([updateId]);
                              },
                            ),
                          ),
                        ),
                      ),
                      Dimens.boxHeight(Dimens.twenty),
                      Text(
                        TranslationUtil.selectPackage,
                        style: Styles.black16.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                      Dimens.boxHeight(Dimens.ten),
                      Column(
                        children: List.generate(
                            controller.packageResponse?.package.length ?? 0,
                            (index) {
                          var package =
                              controller.packageResponse?.package[index];
                          var iconData = Icons.message;
                          var secondLineText = '';
                          if (package == 'Messaging') {
                            secondLineText = 'Chat with doctor';
                            iconData = Icons.message;
                          } else {
                            if (package == 'Voice Call') {
                              secondLineText = 'Voice call with doctor';
                              iconData = Icons.call;
                            } else if (package == 'Video Call') {
                              secondLineText = 'Video call with doctor';
                              iconData = Icons.video_call;
                            } else if (package == 'In Person') {
                              secondLineText = 'In Person visit with doctor';
                              iconData = Icons.person;
                            }
                          }
                          return getPackageUI(
                            package ?? '',
                            secondLineText,
                            iconData,
                            index,
                          );
                        }),
                      )
                    ],
                  ),
                ),
        ),
      );

  Widget getPackageUI(
    String package,
    String secondLineText,
    IconData iconData,
    int index,
  ) {
    return Container(
      margin: Dimens.edgeInsets(bottom: Dimens.fifteen),
      padding: Dimens.edgeInsetsSymmetric(
        vertical: Dimens.eight,
        horizontal: Dimens.twelve,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.ten),
          border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Dimens.boxWidth(Dimens.five),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    package,
                    style: Styles.black16.copyWith(
                      color: Colors.blue,
                      fontSize: Dimens.fourteen,
                    ),
                  ),
                  Dimens.boxWidth(Dimens.five),
                  Text(
                    secondLineText,
                    style: Styles.black16
                        .copyWith(color: Colors.grey, fontSize: Dimens.twelve),
                  ),
                ],
              ),
            ],
          ),
          Radio<int>(
              value: index,
              groupValue: currentSelectedPackageIndex,
              onChanged: (newValue) {
                currentSelectedPackageIndex = newValue as int;
                bookingData.package = package;
                controller.update([updateId]);
              }),
        ],
      ),
    );
  }
}
