import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kf_ocs/models/users_model.dart';
import 'package:kf_ocs/services/location_service.dart';
import 'package:kf_ocs/ui/authorization/login_page.dart';
import 'package:kf_ocs/utils/app_strings.dart';
import 'package:kf_ocs/utils/constants.dart';
import 'package:kf_ocs/utils/dialog.dart';
import 'package:kf_ocs/utils/log_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  late SharedPreferences? prefs;

  @override
  void onInit() {
    super.onInit();
    initialization();
  }

  void initialization() async {
    screenWidth = MediaQuery.of(Get.context!).size.width;
    screenHeight = MediaQuery.of(Get.context!).size.height;
    prefs = await SharedPreferences.getInstance();
    if (user != null) {
      // User is authenticated, you can access their email
      userMail = user!.email ?? "";
      userName = user!.displayName ?? "";
      photoUrl = user!.photoURL ?? "";
    }

    String uid = FirebaseAuth.instance.currentUser!.uid;
    prefs?.setString(Constants.USER_ID, uid);
    UsersModel.userEmail = prefs?.getString(Constants.USER_EMAIL) ?? "";
    UsersModel.userId = prefs?.getString(Constants.USER_ID) ?? "";

    startLocService();
  }

  void startLocService() async {
    LocationService().initialize();

    LocationService().getLatitude().then((value) {
      UsersModel.lat = value!;
      update();
      logD("User Lat : ${UsersModel.lat}");
    });

    LocationService().getLongitude().then((value) {
      UsersModel.long = value!;
      update();
      logD("User Long : ${UsersModel.long}");
    });
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
