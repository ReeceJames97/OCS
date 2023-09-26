import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/controllers/splash_screen_controller.dart';
import 'package:kf_ocs/utils/app_colors.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        builder: (controller) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Container(
                color: AppColors.standardBtnColor,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Lottie.asset('assets/images/splash_screen.json',
                          width: 300,
                          height: 250,
                          animate: true,
                          repeat: true,
                          fit: BoxFit.fill),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
