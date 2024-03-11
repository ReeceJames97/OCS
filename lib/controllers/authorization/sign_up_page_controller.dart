import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kf_ocs/controllers/authorization/auth_controller.dart';
import 'package:kf_ocs/ui/authorization/login_page.dart';
import 'package:kf_ocs/utils/app_strings.dart';
import 'package:kf_ocs/utils/constants.dart';
import 'package:kf_ocs/utils/dialog.dart';
import 'package:kf_ocs/utils/toast.dart';
import 'package:kf_ocs/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main_navigator.dart';

class SignUpPageController extends GetxController {
  final key = GlobalKey<ScaffoldState>();
  final txtUserIdController = TextEditingController();
  final txtEmailController = TextEditingController();
  final txtPasswordController = TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;
  RxBool isPasswordVisible = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late SharedPreferences? prefs;

  @override
  void onInit() {
    super.onInit();
    initialization();
  }

  @override
  void dispose() {
    super.dispose();
    txtUserIdController.dispose();
    txtPasswordController.dispose();
    txtEmailController.dispose();
  }

  Future<void> initialization() async{
    screenHeight = MediaQuery.of(Get.context!).size.height;
    screenWidth = MediaQuery.of(Get.context!).size.width;
    prefs = await SharedPreferences.getInstance();
  }

  ///Update isPasswordVisible
  void updatePasswordVisible() {
    isPasswordVisible = (!isPasswordVisible.value).obs;
    update();
  }

  Future<void> onTapSignUpBtn() async {
    String email = getEmptyString(txtEmailController.text.trim().toString());
    String password =
        getEmptyString(txtPasswordController.text.trim().toString());

    if (password.length < 6) {
      showToast("Password should be at least 6 characters");
      return;
    }
    if (isNotNullEmptyString(email) && isNotNullEmptyString(password)) {
      showLoadingDialog();
      bool registrationResult =
          await AuthController.instance.register(email, password);

      if (registrationResult) {
        prefs?.setString(Constants.USER_EMAIL, email);
        update();
        hideDialog();
        showToast(AppStrings.accCreatedSuccessfully);
        Get.off(() => const MainNavigator());
      } else {
        hideDialog();
        showToast(AppStrings.accCreationFailed);
      }
    } else {
      showToast(AppStrings.plsEnterEmailAndPassword);
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      showLoadingDialog();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final authResult = await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      assert(!user!.isAnonymous);
      assert(await user?.getIdToken() != null);

      final User? currentUser = _auth.currentUser;
      assert(user?.uid == currentUser?.uid);
      hideDialog();

      Get.to(() => const MainNavigator());
    } catch (e) {
      hideDialog();
      // Handle and display the error
      showToast("Error during Google sign-in: $e");
    }
  }

  void onTapLoginText() {
    Get.off(() => const LoginPage());
  }
}
