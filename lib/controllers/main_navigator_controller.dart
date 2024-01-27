import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kf_ocs/ui/authorization/login_page.dart';
import 'package:kf_ocs/utils/app_strings.dart';
import 'package:kf_ocs/utils/dialog.dart';

class MainNavigatorController extends GetxController {
  final key = GlobalKey<ScaffoldState>();
  double screenHeight = 0;
  double screenWidth = 0;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final user = FirebaseAuth.instance.currentUser;
  String userMail = "";
  String userName = "";
  String photoUrl = "";
  RxString appBarTitle = AppStrings.appName.obs;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    initialization();
  }

  void initialization() {
    screenWidth = MediaQuery.of(Get.context!).size.width;
    screenHeight = MediaQuery.of(Get.context!).size.height;
    if (user != null) {
      // User is authenticated, you can access their email
      userMail = user!.email ?? "";
      userName = user!.displayName ?? "";
      photoUrl = user!.photoURL ?? "";
    }
  }

  ///Confirm Logout
  void confirmLogout() {
    Get.back();
    showLoadingDialog();

    Future.delayed(const Duration(seconds: 2), () {
      logout();
      hideDialog();
      update();
    });
  }

  ///Logout
  Future<void> logout() async {
    await auth.signOut();
    await googleSignIn.signOut();
    Get.off(() => const LoginPage());
  }
}
