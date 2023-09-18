import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/controllers/home_screen_controller.dart';
import 'package:kf_ocs/custom_views/keyboard_dimiss_view.dart';
import 'package:kf_ocs/utils/appbar_utils.dart';
import 'package:kf_ocs/utils/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
        builder: (controller) => keyboardDismissView(child: Scaffold(
          key: controller.scaffoldKey,
          appBar: getAppbar(AppStrings.home),
          resizeToAvoidBottomInset: true,
          body: const Center(
            child: Text("Home"),
          ),
        )));
  }
}
