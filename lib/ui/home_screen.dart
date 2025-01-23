import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/controllers/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
          init: HomeScreenController(),
          builder: (controller) => Scaffold(
                  key: controller.scaffoldKey,
                  resizeToAvoidBottomInset: true,
                  body: Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text("Home"),
                  ),
                ),
          // ),
    );
  }

}
