import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kf_ocs/ui/authorization/login_page.dart';
import 'package:kf_ocs/utils/dialog.dart';

class HomeScreenController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  double screenHeight = 0;
  double screenWidth = 0;
  final AdvancedDrawerController advancedDrawer = AdvancedDrawerController();
  final user = FirebaseAuth.instance.currentUser;
  String userMail = "";
  String photoUrl = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    initialization();
  }

  @override
  void dispose() {
    super.dispose();
    advancedDrawer.dispose();
  }

  void initialization() {
    screenHeight = MediaQuery.of(Get.context!).size.height;
    screenWidth = MediaQuery.of(Get.context!).size.width;
    if (user != null) {
      // User is authenticated, you can access their email
      userMail = user!.email ?? "";
      photoUrl = user!.photoURL ?? "";
    }
  }

  void drawerControl() {
    advancedDrawer.showDrawer();
  }

  void confirmLogout() {
    Get.back();
    showLoadingDialog();

    Future.delayed(const Duration(seconds: 2), () {
      logout();
      hideDialog();
      update();
    });
  }

  Future<void> logout() async {
    await auth.signOut();
    await googleSignIn.signOut();
    Get.off(() => const LoginPage());
  }
}
