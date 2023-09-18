import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/ui/authorization/sign_up_page.dart';
import 'package:kf_ocs/ui/home_screen.dart';
import 'package:kf_ocs/utils/constants.dart';
import 'package:kf_ocs/utils/strings.dart';
import 'package:kf_ocs/utils/toast.dart';
import 'package:kf_ocs/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final userIdController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;
  RxBool isRememberMe = false.obs;
  RxBool isPasswordVisible = false.obs;
  late SharedPreferences? prefs;

  @override
  void onInit() {
    super.onInit();
    initialization();
  }

  @override
  void dispose() {
    super.dispose();
    userIdController.dispose();
    passwordController.dispose();
    emailController.dispose();
  }

  void initialization() {
    screenHeight = MediaQuery.of(Get.context!).size.height;
    screenWidth = MediaQuery.of(Get.context!).size.width;
    // isKeyboardVisible = KeyboardVisibilityProvider.isKeyboardVisible(Get.context!);
    // logD(isKeyboardVisible.toString());
  }

  Future<void> onTapLoginBtn() async {
    FocusScope.of(Get.context!).unfocus();
    String userName = userIdController.text.trim();
    String password = passwordController.text.trim().toString();

    if (!isNotNullEmptyString(userName)) {
      showToast(AppStrings.userNameIsEmpty);
    } else if (!isNotNullEmptyString(password)) {
      showToast(AppStrings.passwordIsEmpty);
    } else {
      try {
        await login(userName, password);
      } catch (e) {
        handleLoginError(e);
      }
    }
  }

  /// Update isRememberMe
  void updateRememberMe(bool? newValue) {
    isRememberMe = (newValue ?? false).obs;
    update();
  }

  Future<void> login(String userName, String password) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection(AppStrings.employee)
        .where('name', isEqualTo: 'james')
        .get();

    if (snapshot.docs.isEmpty) {
      showToast("Employee does not exist!");
      return;
    }

    if (password == snapshot.docs[0]['password']) {
      prefs = await SharedPreferences.getInstance();
      prefs?.setString(Constants.USERNAME, userName);
      prefs?.setString(Constants.PASSWORD, password);
      Get.off(() => const HomeScreen());
    } else {
      showToast(AppStrings.passwordIsNotCorrect);
    }
  }

  void handleLoginError(dynamic error) {
    String errorMessage = "Error occurred!";
    if (error.toString().toLowerCase() ==
        "rangeerror (index): invalid value: valid value range is empty: 0"
            .toLowerCase()) {
      errorMessage = AppStrings.employeeDoesNotExist;
    }
    showToast(errorMessage);
  }

  ///Update isPasswordVisible
  void updatePasswordVisible() {
    isPasswordVisible = (!isPasswordVisible.value).obs;
    update();
  }

  void onTapCreateText() {
    Get.off(() => const SignUpPage());
  }
}
