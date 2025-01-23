import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/controllers/today_screen_controller.dart';
import 'package:kf_ocs/custom_views/keyboard_dimiss_view.dart';
import 'package:kf_ocs/utils/app_colors.dart';
import 'package:kf_ocs/utils/app_strings.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodayScreenController>(
      init: TodayScreenController(),
      builder: (controller) => keyboardDismissView(
        child: Scaffold(
          key: controller.key,
          appBar: AppBar(
            title: const Text(AppStrings.today),
            centerTitle: true,
            titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            backgroundColor: AppColors.appBarColor,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          resizeToAvoidBottomInset: true,
          body: buildBodyWidget(),
          // drawer: ,
        ),
      ),
    );
  }

  Widget buildBodyWidget() {
    TodayScreenController controller = Get.put(TodayScreenController());
    return SingleChildScrollView(
      child: Container(
        height: controller.screenHeight,
        color: AppColors.backgroundColor,
        child: const Column(
          children: [
            Text("Today"),
          ],
        ),
      ),
    );
  }
}
