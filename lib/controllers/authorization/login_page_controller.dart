import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kf_ocs/controllers/authorization/auth_controller.dart';
import 'package:kf_ocs/ui/authorization/sign_up_page.dart';
import 'package:kf_ocs/utils/app_strings.dart';
import 'package:kf_ocs/utils/constants.dart';
import 'package:kf_ocs/utils/dialog.dart';
import 'package:kf_ocs/utils/toast.dart';
import 'package:kf_ocs/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main_navigator.dart';

class LoginPageController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final txtUserIdController = TextEditingController();
  final txtPasswordController = TextEditingController();
  final txtEmailController = TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;
  RxBool isRememberMe = false.obs;
  RxBool isPasswordVisible = false.obs;
  late SharedPreferences? prefs;
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
    txtUserIdController.dispose();
    txtPasswordController.dispose();
    txtEmailController.dispose();
  }

  Future<void> initialization() async{
    screenHeight = MediaQuery.of(Get.context!).size.height;
    screenWidth = MediaQuery.of(Get.context!).size.width;
    prefs = await SharedPreferences.getInstance();
    // isKeyboardVisible = KeyboardVisibilityProvider.isKeyboardVisible(Get.context!);
    // logD(isKeyboardVisible.toString());
  }

  void loginWithUserNameAndPassword(){
    String email = getEmptyString(txtEmailController.text.trim().toString());
    String password = getEmptyString(txtPasswordController.text.trim().toString());

    if (isNotNullEmptyString(email) && isNotNullEmptyString(password)) {

    }
  }

  Future<void> onTapLoginBtn() async {
    String email = getEmptyString(txtEmailController.text.trim().toString());
    String password =
        getEmptyString(txtPasswordController.text.trim().toString());

    if (isNotNullEmptyString(email) && isNotNullEmptyString(password)) {
      showLoadingDialog();
      bool loginResult = await AuthController.instance.login(email, password);

      if (loginResult) {
        prefs?.setString(Constants.USER_EMAIL, email);
        update();
        hideDialog();
        showToast(AppStrings.loginSuccessfully);
        Get.off(() => const MainNavigator());
      } else {
        hideDialog();
        showToast(AppStrings.loginFailed);
      }
    } else {
      showToast(AppStrings.plsEnterEmailAndPassword);
    }
    // FocusScope.of(Get.context!).unfocus();
    // String userName = txtUserIdController.text.trim();
    // String password = txtPasswordController.text.trim().toString();
    //
    // if (!isNotNullEmptyString(userName)) {
    //   showToast(AppStrings.userNameIsEmpty);
    // } else if (!isNotNullEmptyString(password)) {
    //   showToast(AppStrings.passwordIsEmpty);
    // } else {
    //   try {
    //     await login(userName, password);
    //   } catch (e) {
    //     handleLoginError(e);
    //   }
    // }
  }

  /// Update isRememberMe
  void updateRememberMe(bool? newValue) {
    isRememberMe = (newValue ?? false).obs;
    update();
  }

  // Future<void> login(String userName, String password) async {
  // QuerySnapshot snapshot = await FirebaseFirestore.instance
  //     .collection(AppStrings.employee)
  //     .where('name', isEqualTo: 'james')
  //     .get();
  //
  // if (snapshot.docs.isEmpty) {
  //   showToast("Employee does not exist!");
  //   return;
  // }
  //
  // if (password == snapshot.docs[0]['password']) {
  //   prefs = await SharedPreferences.getInstance();
  //   prefs?.setString(Constants.USERNAME, userName);
  //   prefs?.setString(Constants.PASSWORD, password);
  //   Get.off(() => const HomeScreen());
  // } else {
  //   showToast(AppStrings.passwordIsNotCorrect);
  // }
  // }

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
      Get.off(() => const MainNavigator());
      update();
    } catch (e) {
      hideDialog();
      // Handle and display the error
      showToast("Error during Google sign-in: $e");
      update();
    }
  }
}
