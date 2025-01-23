import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AttendanceHistoryPageController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  double screenHeight = 0;
  double screenWidth = 0;

  String month = DateFormat("MMMM").format(DateTime.now());

  void initialization() {
    screenHeight = MediaQuery.of(Get.context!).size.height;
    screenWidth = MediaQuery.of(Get.context!).size.width;
  }

}
