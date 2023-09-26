import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kf_ocs/ui/authorization/login_page.dart';
import 'package:kf_ocs/ui/home_screen.dart';
import 'package:kf_ocs/utils/toast.dart';

class SignUpPageController extends GetxController{
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final userIdController =  TextEditingController();
  final passwordController =  TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;
  RxBool isPasswordVisible = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

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

  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
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

      Get.to(() => const HomeScreen());
    } catch (e) {
      // Handle and display the error
      showToast("Error during Google sign-in: $e");
    }
  }

  void onTapLoginText(){
    Get.off(() => const LoginPage());
  }

}