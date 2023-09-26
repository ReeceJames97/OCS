import 'package:get/get.dart';
import 'package:kf_ocs/ui/authorization/login_page.dart';
import 'package:kf_ocs/ui/home_screen.dart';
import 'package:kf_ocs/utils/constants.dart';
import 'package:kf_ocs/utils/share_preference_utils.dart';
import 'package:kf_ocs/utils/utils.dart';
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
    prefs = await SharedPreferences.getInstance();
    String userName =
        SharePreferenceUtils().getString(prefs?.getString(Constants.USERNAME));
    if (isNotNullEmptyString(userName)) {
      userAvailable = true;
      update();
    } else {
      userAvailable = false;
      update();
    }

    await Future.delayed(const Duration(seconds: 3), () {
      // Get.off(() => userAvailable! ? const HomeScreen() : const LoginPage());
      // Get.off(() => const LoginPage());
      Get.off(() => const HomeScreen());
    });
  }

}
