import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/ui/authorization/login_page.dart';
import 'package:kf_ocs/utils/toast.dart';

class SignUpPageController extends GetxController{
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final userIdController =  TextEditingController();
  final passwordController =  TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;
  RxBool isPasswordVisible = false.obs;

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
  }

  void initialization(){
    screenHeight = MediaQuery.of(Get.context!).size.height;
    screenWidth = MediaQuery.of(Get.context!).size.width;
  }

  ///Update isPasswordVisible
  void updatePasswordVisible() {
    isPasswordVisible = (!isPasswordVisible.value).obs;
    update();
  }

  Future<void> onTapSignUpBtn() async {
    showToast("Sign Up");
    // FocusScope.of(Get.context!).unfocus();
    // String userName = userIdController.text.trim();
    // String password = passwordController.text.trim().toString();
    //
    // if (!isNotNullEmptyString(userName)) {
    //   showToast("Username is empty!");
    // } else if (!isNotNullEmptyString(password)) {
    //   showToast("Password is empty!");
    // } else {
    //   try {
    //     await login(userName, password);
    //   } catch (e) {
    //     handleLoginError(e);
    //   }
    // }
  }

  void onTapLoginText(){
    Get.off(() => const LoginPage());
  }

}