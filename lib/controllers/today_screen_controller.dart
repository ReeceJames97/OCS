import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class TodayScreenController extends GetxController {
  final key = GlobalKey<ScaffoldState>();
  double screenHeight = 0;
  double screenWidth = 0;
  final AdvancedDrawerController advancedDrawer = AdvancedDrawerController();

  @override
  void onInit() {
    super.onInit();
    initialization();
  }

  void initialization() {
    screenHeight = MediaQuery.of(Get.context!).size.height;
    screenWidth = MediaQuery.of(Get.context!).size.width;
  }

  void drawerControl() {
    advancedDrawer.showDrawer();
  }
}
