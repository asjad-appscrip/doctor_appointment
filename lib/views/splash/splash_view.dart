import 'package:doctor_appointment/controller/controller.dart';
import 'package:doctor_appointment/res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<SplashController>(
        builder: (context) => Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(
                  size: Dimens.hundred,
                  duration: const Duration(seconds: 2),
                ),
              ],
            ),
          ),
        ),
      );
}
