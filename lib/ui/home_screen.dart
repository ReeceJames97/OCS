import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/controllers/home_screen_controller.dart';
import 'package:kf_ocs/controllers/main_navigator_controller.dart';
import 'package:kf_ocs/ui/nav_bar.dart';
import 'package:kf_ocs/utils/app_colors.dart';
import 'package:kf_ocs/utils/toast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
