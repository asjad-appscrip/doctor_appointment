// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Contains the dimensions and padding used
/// all over the application.
/// Will be ignored for test since all are static values and would not change.
abstract class Dimens {
  static double zero = 0.sp;
  static double one = 1.sp;
  static double two = 2.sp;
  static double three = 3.sp;
  static double four = 4.sp;
  static double five = 5.sp;
  static double six = 6.sp;
  static double seven = 7.sp;
  static double eight = 8.sp;
  static double nine = 9.sp;
  static double ten = 10.sp;
  static double eleven = 11.sp;
  static double twelve = 12.sp;
  static double thirteen = 13.sp;
  static double fourteen = 14.sp;
  static double fifteen = 15.sp;
  static double sixteen = 16.sp;
  static double seventeen = 17.sp;
  static double eighteen = 18.sp;
  static double nineteen = 19.sp;
  static double twenty = 20.sp;
  static double twentyOne = 21.sp;
  static double twentyTwo = 22.sp;
  static double twentyThree = 23.sp;
  static double twentyFour = 24.sp;
  static double twentyFive = 25.sp;
  static double twentySix = 26.sp;
  static double twentySeven = 27.sp;
  static double twentyEight = 28.sp;
  static double twentyNine = 29.sp;
  static double thirty = 30.sp;
  static double thirtyOne = 31.sp;
  static double thirtyTwo = 32.sp;
  static double thirtyThree = 33.sp;
  static double thirtyFour = 34.sp;
  static double thirtyFive = 35.sp;
  static double thirtySix = 36.sp;
  static double thirtySeven = 37.sp;
  static double thirtyEight = 38.sp;
  static double thirtyNine = 39.sp;
  static double fourty = 40.sp;
  static double fourtyTwo = 42.sp;
  static double fourtyThree = 43.sp;
  static double fourtyFour = 44.sp;
  static double fourtyFive = 45.sp;
  static double fourtySix = 46.sp;
  static double fourtySeven = 47.sp;
  static double fourtyEight = 48.sp;
  static double fourtyNine = 49.sp;
  static double fifty = 50.sp;
  static double fiftyOne = 51.sp;
  static double fiftyTwo = 52.sp;
  static double fiftyThree = 53.sp;
  static double fiftyFour = 54.sp;
  static double fiftyFive = 55.sp;
  static double fiftySix = 56.sp;
  static double fiftySeven = 57.sp;
  static double fiftyEight = 58.sp;
  static double fiftyNine = 59.sp;
  static double sixty = 60.sp;
  static double seventyThree = 63.sp;
  static double sixtySeven = 67.sp;
  static double seventySix = 76.sp;
  static double seventyEight = 78.sp;
  static double sixtySix = 66.sp;
  static double sixtyOne = 61.sp;
  static double sixtyTwo = 62.sp;
  static double sixtyThree = 63.sp;
  static double sixtyFour = 64.sp;
  static double sixtyFive = 65.sp;
  static double sixtyEight = 68.sp;
  static double sixtyNine = 69.sp;
  static double seventy = 70.sp;
  static double seventyTwo = 72.sp;
  static double seventyFour = 74.sp;
  static double seventyFive = 75.sp;
  static double eighty = 80.sp;
  static double eightyThree = 83.sp;
  static double eightyFour = 84.sp;
  static double eightyFive = 85.sp;
  static double eightySix = 86.sp;
  static double eightySeven = 87.sp;
  static double eightyEight = 88.sp;
  static double eightyNine = 89.sp;
  static double ninty = 90.sp;
  static double nintyTwo = 92.sp;
  static double nintyThree = 93.sp;
  static double nintyFour = 94.sp;
  static double nintyFive = 95.sp;
  static double nintySix = 96.sp;
  static double nintySeven = 97.sp;
  static double nintyEight = 98.sp;
  static double nintyNine = 99.sp;
  static double hundred = 100.sp;
  static double hundredOne = 101.sp;
  static double hundredNine = 109.sp;
  static double hundredThirteen = 113.sp;
  static double hundredNineteen = 119.sp;
  static double hundredFour = 104.sp;
  static double hundredFive = 105.sp;
  static double hundredSix = 106.sp;
  static double hundredSeven = 107.sp;
  static double hundredEight = 108.sp;
  static double hundredEighteen = 118.sp;
  static double hundredTwelve = 112.sp;
  static double hundredTen = 110.sp;
  static double hundredFourteen = 114.sp;
  static double hundredFifteen = 115.sp;
  static double hundredSixteen = 116.sp;
  static double hundredTwenty = 120.sp;
  static double hundredTwentyOne = 121.sp;
  static double hundredTwentyFive = 125.sp;
  static double hundredTwentyTwo = 122.sp;
  static double hundredTwentySeven = 127.sp;
  static double hundredTwentyEight = 128.sp;
  static double hundredThirty = 130.sp;
  static double hundredThirtyTwo = 132.sp;
  static double hundredThirtyThree = 133.sp;
  static double hundredThirtyFour = 134.sp;
  static double hundredThirtyFive = 135.sp;
  static double hundredThirtySix = 136.sp;
  static double hundredThirtySeven = 137.sp;
  static double hundredThirtyEight = 138.sp;
  static double hundredFourty = 140.sp;
  static double hundredFourtyTwo = 142.sp;
  static double hundredFourtyFour = 144.sp;
  static double hundredFourtyFive = 145.sp;
  static double hundredFourtySeven = 147.sp;
  static double hundredFourtyEight = 148.sp;
  static double hundredFifty = 150.sp;
  static double hundredFiftyOne = 151.sp;
  static double hundredFiftyFive = 155.sp;
  static double hundredFiftySeven = 157.sp;
  static double hundredFiftyEight = 158.sp;
  static double hundredSixty = 160.sp;
  static double hundredSixtyTwo = 162.sp;
  static double hundredSixtyFour = 164.sp;
  static double hundredSixtySeven = 167.sp;
  static double hundredSixtyEight = 168.sp;
  static double hundredSixtyNine = 169.sp;
  static double hundredSixtySix = 166.sp;
  static double hundredSixtyFive = 165.sp;
  static double hundredSeventy = 170.sp;
  static double hundredSeventyTwo = 172.sp;
  static double hundredSeventySix = 176.sp;
  static double hundredSeventyNine = 179.sp;
  static double hundredEighty = 180.sp;
  static double hundredEightyTwo = 182.sp;
  static double hundredEightyEight = 188.sp;
  static double hundredNinty = 190.sp;
  static double hundredNintyThree = 193.sp;
  static double twoHundred = 200.sp;
  static double twoHundredFive = 205.sp;
  static double twoHundredSix = 206.sp;
  static double twoHundredThirteen = 213.sp;
  static double twoHundredTen = 210.sp;
  static double twoHundredTwentyTwo = 222.sp;
  static double twoHundredTwentyEight = 228.sp;
  static double twoHundredThirtyOne = 231.sp;
  static double twoHundredThirtySix = 236.sp;
  static double twoHundredFourty = 240.sp;
  static double twoHundredFifty = 250.sp;
  static double twoHundredFiftyFive = 255.sp;
  static double twoHundredSixtyFour = 264.sp;
  static double twoHundredSixtySix = 266.sp;
  static double twoHundredSixtyEight = 268.sp;
  static double twoHundredEighty = 280.sp;
  static double twoHundredNinty = 290.sp;
  static double twoHundredNintyOne = 291.sp;
  static double twoHundredNintyTwo = 292.sp;
  static double twoHundredNintyFive = 295.sp;
  static double twoHundredNintEight = 298.sp;
  static double twoHundredNintyNine = 299.sp;
  static double threeHundred = 300.sp;
  static double threeHundredOne = 301.sp;
  static double threeHundredTwo = 302.sp;
  static double threeHundredTwelve = 312.sp;
  static double threeHundredSeventeen = 317.sp;
  static double threeHundredTwentyTwo = 322.sp;
  static double threeHundredTwentyThree = 323.sp;
  static double threeHundredTwentyFour = 324.sp;
  static double threeHundredTwentySix = 326.sp;
  static double threeHundredTwentySeven = 327.sp;
  static double threeHundredTwentyEight = 328.sp;
  static double threeHundredTwentyNine = 329.sp;
  static double threeHundredThirty = 330.sp;
  static double threeHundredThirtyTwo = 332.sp;
  static double threeHundredThirtyFive = 335.sp;
  static double threeHundredFourty = 340.sp;
  static double threeHundredFourtyThree = 343.sp;
  static double threeHundredFifty = 350.sp;
  static double threeHundredFiftyFour = 354.sp;
  static double threeHundredSeventyTwo = 372.sp;
  static double threeHundredSeventyFive = 375.sp;
  static double fourHundred = 400.sp;
  static double fourHundredFifty = 450.sp;
  static double fiveHundred = 500.sp;
  static double fiveHundredTen = 510.sp;
  static double fiveHundredTwenty = 520.sp;
  static double fiveHundredThirtyEight = 538.sp;
  static double fiveHundredFifty = 550.sp;
  static double fiveHundredSeventyThree = 573.sp;
  static double sixHundred = 600.sp;
  static double sixHundredThirtyOne = 631.sp;
  static double sixHundredFifty = 650.sp;
  static double fifteenStatic = 15;
  static double twentyStatic = 20;
  static double hundredStatic = 100;
  static double hundredFiftyStatic = 150;
  static double twoHundredStatic = 200;
  static double twoHundredFifteen = 215;
  static double twoHundredSeventy = 270;
  static double twoHundredSeventySix = 276.sp;

  static double pointZeroZeroEight = 0.08.sp;
  static double pointZeroZeroNine = 0.09.sp;
  static double pointOne = 0.1.sp;
  static double pointOneStatic = 0.1;
  static double pointOneSeven = 0.17.sp;
  static double pointOneEight = 0.18.sp;
  static double pointTwo = 0.2.sp;
  static double pointThree = 0.3.sp;
  static double pointThreeTwo = 0.32.sp;
  static double pointThreeThree = 0.33.sp;
  static double pointThreeFour = 0.34.sp;
  static double pointThreeFive = 0.35.sp;
  static double pointFour = 0.4.sp;
  static double pointFourFive = 0.45.sp;
  static double pointFive = 0.5.sp;
  static double pointFiveFive = 0.55.sp;
  static double pointSix = 0.6.sp;
  static double pointSixFive = 0.65.sp;
  static double pointSeven = 0.7.sp;
  static double pointEight = 0.8.sp;
  static double pointNine = 0.9.sp;
  static double pointNineFour = 0.94.sp;
  static double pointNineSix = 0.96.sp;
  static double onePointFive = 1.5.sp;
  static double boostBottomSheetHeight = 500.sp;

  /// Get the height with the percent value of the screen height.
  static double percentHeight(double percentValue) => percentValue.sh;

  /// Get the width with the percent value of the screen width.
  static double percentWidth(double percentValue) => percentValue.sw;

  /// Returns Box with requested height value
  static SizedBox boxHeight(double height) =>
      height == 0 ? const SizedBox.shrink() : SizedBox(height: height);

  /// Returns Box with requested width value
  static SizedBox boxWidth(double width) => SizedBox(width: width);

  static EdgeInsets edgeInsets({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) =>
      EdgeInsets.fromLTRB(
        left ?? zero,
        top ?? zero,
        right ?? zero,
        bottom ?? zero,
      );

  static EdgeInsets edgeInsetsAll(double allSide) => EdgeInsets.all(allSide);

  static EdgeInsets edgeInsetsSymmetric({
    required double vertical,
    required double horizontal,
  }) =>
      EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      );
}
