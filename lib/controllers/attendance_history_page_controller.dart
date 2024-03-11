import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:kf_ocs/ui/authorization/login_page.dart';
import 'package:kf_ocs/utils/dialog.dart';

class AttendanceHistoryPageController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  double screenHeight = 0;
  double screenWidth = 0;

  String month = DateFormat("MMMM").format(DateTime.now());

  @override
  void onInit() {
    super.onInit();
    initialization();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initialization() {
    screenHeight = MediaQuery.of(Get.context!).size.height;
    screenWidth = MediaQuery.of(Get.context!).size.width;
  }

}
