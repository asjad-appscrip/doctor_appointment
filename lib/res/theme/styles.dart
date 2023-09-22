//coverage:ignore-file

import 'package:doctor_appointment/res/res.dart';
import 'package:flutter/material.dart';

/// A chunk of styles used in the application.
/// Will be ignored for test since all are static values and would not change.
abstract class Styles {
  static TextStyle whiteBold16 = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixteen,
  );
  static TextStyle white16 = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixteen,
  );

  static TextStyle blackBold16 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixteen,
  );
  static TextStyle black16 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixteen,
  );
}
