import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/controllers/authorization/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late SharedPreferences? prefs;
  bool? userAvailable = false;

  @override
  void onInit() {
    super.onInit();
    initialization();
  }

  Future<void> initialization() async {
    // Wait for a few seconds to display the splash screen
    await Future.delayed(const Duration(seconds: 3));

    // Initialize Firebase or perform any other initializations here
    await Firebase.initializeApp();

    // Firebase is initialized, let the AuthController handle navigation
    final authController = AuthController.instance;
    authController.checkAuthenticationStatus();
  }
}
