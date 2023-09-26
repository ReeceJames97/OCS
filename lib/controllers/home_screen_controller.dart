import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kf_ocs/ui/authorization/login_page.dart';
import 'package:kf_ocs/utils/dialog.dart';

class HomeScreenController extends GetxController{
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  double screenHeight = 0;
  double screenWidth = 0;
  final AdvancedDrawerController advancedDrawer = AdvancedDrawerController();
  // final sideBarController = SidebarXController(selectedIndex: 0, extended: true);
  // final isSmallScreen = MediaQuery.of(Get.context!).size.width < 600;


  @override
  void onInit() {
    super.onInit();
    initialization();
  }

  void initialization() {
    screenHeight = MediaQuery.of(Get.context!).size.height;
    screenWidth = MediaQuery.of(Get.context!).size.width;
    // Get.put(sideBarController);

  }

  void drawerControl(){
    advancedDrawer.showDrawer();
  }

  void confirmCallBack() {
    Get.back();
    showLoadingDialog();

    Future.delayed(const Duration(seconds: 2), () {
      logoutGoogle();
      hideDialog();
      update();
    });
  }

  Future<void> logoutGoogle() async {
    await googleSignIn.signOut();
    // Get.back();
    Get.off(() => const LoginPage());
  }

}