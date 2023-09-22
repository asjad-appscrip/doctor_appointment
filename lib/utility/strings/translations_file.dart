// coverage:ignore-file

import 'package:doctor_appointment/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationsFile extends Translations {
  /// List of locales used in the application
  static const listOfLocales = <Locale>[
    Locale('en'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'appName': StringConstants.appName,
          'time': 'Time',
          'day': 'Day',
          'patients': 'Patients',
          'yearsExp': 'Years Exp.',
          'rating': 'Rating',
          'review': 'Review',
          'bookAppointment': 'Book Appointment',
          'makeAppointment': 'Make Appointment',
          'next': 'Next',
          'selectPackage': 'Select Package',
          'selectDuration': 'Select Duration',
          'reviewSummary': 'Review Summary',
          'confirm': 'Confirm',
          'dateAndHour': 'Date & Hour',
          'package': 'Package',
          'duration': 'Duration',
          'bookingFor': 'Booking for',
          'confirmation': 'Confirmation',
          'viewAppointment': 'View Appointments',
          'bookAnother': 'Book Another',
          'appointmentConfirmed': 'Appointment Confirmed',
          'appointmentSuccessfullyBooked': 'You have successfully booked appointment with',
          'myBookings': 'My Bookings',
          'bookingId': 'Booking ID',
          'cancel': 'Cancel',
          'reschedule': 'Reschedule',
          'edit': 'Edit',
        },
      };
}
