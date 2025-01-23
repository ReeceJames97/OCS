import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/controllers/main_navigator_controller.dart';
import 'package:kf_ocs/ui/attendance_history_page.dart';
import 'package:kf_ocs/ui/check_in_page.dart';
import 'package:kf_ocs/ui/home_screen.dart';
import 'package:kf_ocs/ui/nav_bar.dart';
import 'package:kf_ocs/ui/profile_page.dart';
import 'package:kf_ocs/ui/setting_page.dart';
import 'package:kf_ocs/ui/users_page.dart';
import 'package:kf_ocs/utils/app_colors.dart';
import 'package:kf_ocs/utils/app_strings.dart';
import 'package:kf_ocs/utils/toast.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}


class _MainNavigatorState extends State<MainNavigator> {
  final MainNavigatorController controller = Get.put(MainNavigatorController());
  var crrTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        final bool shouldPop = await onWillPop();
        if (shouldPop) {
          Navigator.pop(context);
        }
      },
      child: GetBuilder<MainNavigatorController>(
        init: MainNavigatorController(),
        builder: (_) => Scaffold(
          key: controller.key,
          appBar: AppBar(
            title: Obx(() => Text(controller.appBarTitle.value)),
            centerTitle: true,
            titleTextStyle: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            backgroundColor: AppColors.appBarColor,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          // drawer:  buildDrawerView(),
          drawer: NavBar(),
          body: buildBodyView(controller.appBarTitle.value),
          resizeToAvoidBottomInset: true,
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    DateTime now = DateTime.now();
    if (now.difference(crrTime) > const Duration(seconds: 2)) {
      crrTime = now;
      showToast("Press Back Button Again to Exit");
      controller.update();
      // Close the drawer if open, otherwise proceed with back button logic
      if (controller.key.currentState?.isDrawerOpen ?? false) {
        controller.key.currentState?.openEndDrawer();
      } else {
        return Future.value(false); // Prevent immediate exit
      }
    } else {
      return Future.value(true); // Allow exit on second back press
    }
    return Future.value(true);
  }

  Widget buildBodyView(String title) {
    if (title == AppStrings.appName) {
      controller.appBarTitle = AppStrings.appName.obs;
      return const HomeScreen();
    } else {
      switch (title) {
        case "CheckIn":
          controller.appBarTitle = "CheckIn".obs;
          return const CheckInPage();

        case "Profile":
          controller.appBarTitle = "Profile".obs;
          return const ProfilePage();

        case "Users":
          controller.appBarTitle = "Users".obs;
          return const UsersPage();

        case "AttendanceHistory":
          controller.appBarTitle = "Attendance History".obs;
          return const AttendanceHistoryPage();

        case "Settings":
          controller.appBarTitle = "Settings".obs;
          return const SettingPage();

        default:
          controller.appBarTitle = AppStrings.appName.obs;
          return const HomeScreen();
      }
    }
  }
}
