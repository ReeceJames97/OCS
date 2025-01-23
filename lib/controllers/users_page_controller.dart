import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersPageController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  double screenHeight = 0;
  double screenWidth = 0;

  void initialization() {
    screenHeight = MediaQuery.of(Get.context!).size.height;
    screenWidth = MediaQuery.of(Get.context!).size.width;
  }

}
