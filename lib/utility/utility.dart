// coverage:ignore-file
import 'dart:async';
import 'dart:convert';

import 'package:doctor_appointment/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';

abstract class Utility {
  /// Returns true if the internet connection is available.
  static Future<bool> isNetworkAvailable() async =>
      await InternetConnectionChecker().hasConnection;

  /// Show loader
  static void showLoader() async {
    const Center(child: CircularProgressIndicator.adaptive());
  }

  /// Show loader
  static Widget showProgressBar() {
    return const Center(child: CircularProgressIndicator.adaptive());
  }

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen == true) {
      Get.back<void>();
    }
  }

  /// Show error dialog from response model
  static void showInfoDialog({
    required ResponseModel data,
    bool isSuccess = false,
    void Function()? onPress,
    String? buttonTitle,
    Widget? title,
  }) async {
    await Get.dialog<dynamic>(
      CupertinoAlertDialog(
        title: title ?? Text(isSuccess ? 'SUCCESS' : 'ERROR'),
        content: Text(
          data.data.isNotEmpty
              ? jsonDecode(data.data)['message'] == null
                  ? ''
                  : jsonDecode(data.data)['message'] as String
              : data.statusCode.toString(),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: onPress ?? Get.back,
            isDefaultAction: true,
            child: buttonTitle != null && buttonTitle.isNotEmpty
                ? Text(buttonTitle)
                : const Text(
                    'Okay',
                  ),
          ),
        ],
      ),
    );
  }

  static String getMonthName(int monthNumber) {
    return DateFormat('MMM').format(DateTime(0, monthNumber));
  }

  static List<DateTime> getNextDaysDate(int numberOfDays) {
    var listOfDates = <DateTime>[];
    final currentDate = DateTime.now();
    for (int i = 0; i < numberOfDays; i++) {
      final date = currentDate.add(Duration(days: i));
      listOfDates.add(date);
    }
    return listOfDates;
  }

  static String getFormattedDate(DateTime dateTime) {
    final dayFormatter = DateFormat('d MMM');
    final weekDayNameFormatter = DateFormat('EEE');
    final formattedDate =
        '${DateTime.now().day == dateTime.day ? 'Today' : weekDayNameFormatter.format(dateTime)}\n${dayFormatter.format(dateTime)}';

    return formattedDate;
  }

  static List<String> getTimeSlots(
    TimeOfDay startTime,
    TimeOfDay endTime,
    int timeInterval,
  ) {
    var listOfSlots = <String>[];
    var timerDifference = ((endTime.hour * 60) + endTime.minute) -
        ((startTime.hour * 60) + startTime.minute);
    final now = DateTime.now();
    final startDate = DateTime(
        now.year, now.month, now.day, startTime.hour, startTime.minute);
    final format = DateFormat.jm();
    listOfSlots.add(getDesiredFormattedDate(startDate, format));
    var initialDate = startDate;
    var numberOfSlots = timerDifference ~/ timeInterval;
    for (var i = 0; i < numberOfSlots; i++) {
      final newDate = initialDate.add(Duration(minutes: timeInterval));
      listOfSlots.add(getDesiredFormattedDate(newDate, format));
      initialDate = newDate;
    }
    return listOfSlots;
  }

  static String getDesiredFormattedDate(DateTime dateTime, DateFormat format) {
    return format.format(dateTime);
  }
}
