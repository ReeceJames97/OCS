import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/ui/authorization/login_page.dart';
import 'package:kf_ocs/utils/dialog.dart';
import 'package:kf_ocs/utils/log_utils.dart';

import '../../main_navigator.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> user;
  FirebaseAuth auth = FirebaseAuth.instance;
  RxString userEmail = ''.obs;

  // bool get isAuthenticated => user.value != null;

  @override
  void onInit() {
    super.onInit();
    logD('AuthController initialized');
    user = Rx<User?>(auth.currentUser);
    user.bindStream(auth.userChanges());
    ever(user, (callback) {
      logD('User change detected: $user');
      _initialScreen(user.value);
    });
  }

  Future<void> _initialScreen(User? user) async {
    if (user != null) {
      final email = user.email;
      if (email != null && email.isNotEmpty) {
        userEmail.value = email;
        logD("Home Page");
        Get.off(() => const MainNavigator());
      } else {
        logD("Login Page");
        Get.off(() => const LoginPage());
      }
    } else {
      logD("Login Page");
      Get.off(() => const LoginPage());
    }

    // if (user != null ) {
    //   // Check if userEmail is empty or not
    //   if (userEmail.isNotEmpty) {
    //     // User is authenticated and userEmail is not empty, navigate to HomeScreen
    //     showToast("Home Page");
    //     logD("Home Page");
    //     Get.off(() => const HomeScreen());
    //   } else {
    //     showToast("Login Page");
    //     logD("Login Page");
    //     // User is authenticated but userEmail is empty, navigate to LoginPage
    //     Get.off(() => const LoginPage());
    //   }
    // } else {
    //   // User is not authenticated, navigate to the login screen
    //   showToast("Login Page");
    //   logD("Login Page");
    //   Get.off(() => const LoginPage());
    // }

    // if(user == null){
    //   logD("Login Page");
    //   Get.offAll(()=> const LoginPage());
    // }else{
    //   Get.offAll(()=>  HomeScreen(user.email.toString()));
    // }
  }

  void checkAuthenticationStatus() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final email = user.email;
      if (email != null && email.isNotEmpty) {
        userEmail.value = email;
        Get.off(() => const MainNavigator());
      } else {
        Get.off(() => const LoginPage());
      }
    } else {
      Get.off(() => const LoginPage());
    }
  }

  Future<bool> register(String email, String password) async {
    try {
      // showLoadingDialog();
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      userEmail.value = email;
      // hideDialog();
      return true;
    } catch (e) {
      // hideDialog();
      return false;
    }
  }

  Future<bool> login(String? email, String? password) async {
    try {
      // showLoadingDialog();
      await auth.signInWithEmailAndPassword(email: email!, password: password!);
      userEmail.value = email;
      // hideDialog();
      return true;
    } catch (e) {
      // hideDialog();
      return false;
    } finally {
      hideDialog();
    }
  }
}
