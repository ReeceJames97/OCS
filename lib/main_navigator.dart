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
    return WillPopScope(
      onWillPop: onWillPop,
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
          drawer: const NavBar(),
          body: buildBodyView(controller.appBarTitle.value),
          resizeToAvoidBottomInset: true,
        ),
      ),
    );
  }

  // Widget buildDrawerView() {
  //   return Drawer(
  //       elevation: 5,
  //       child: ListView(
  //           shrinkWrap: true,
  //           primary: false,
  //           padding: EdgeInsets.zero,
  //           children: [
  //             DrawerHeader(
  //               decoration: const BoxDecoration(
  //                 color: AppColors.appBarColor,
  //               ),
  //               child: Center(
  //                 child: Column(
  //                   children: [
  //                     Expanded(
  //                       flex: 4,
  //                       child: (controller.photoUrl.isNotEmpty)
  //                           ? CircleAvatar(
  //                           backgroundColor: AppColors.appBarColor,
  //                           radius: 37,
  //                           child: CircleAvatar(
  //                               maxRadius: 35,
  //                               backgroundImage:
  //                               NetworkImage(controller.photoUrl)))
  //                           : CircleAvatar(
  //                         backgroundColor: AppColors.appBarColor,
  //                         radius: 37,
  //                         child: CircleAvatar(
  //                           maxRadius: 35,
  //                           backgroundColor: AppColors.standardBtnColor,
  //                           child: SvgPicture.asset(
  //                             'assets/images/profile.svg',
  //                             width: 80,
  //                             height: 80,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //
  //                     ///Name
  //                     (controller.userName.isNotEmpty)
  //                         ? Expanded(
  //                       flex: 1,
  //                       child: Text(
  //                         controller.userName.toString(),
  //                         style: TextStyle(
  //                             fontSize:
  //                             CustomScreenUtil().setSp(regularFont()),
  //                             color: AppColors.backgroundColor,
  //                             fontWeight: FontWeight.bold
  //                           // fontFamily: "NexaBold"
  //                         ),
  //                       ),
  //                     )
  //                         : Text(
  //                       AppStrings.name,
  //                       style: TextStyle(
  //                           fontSize:
  //                           CustomScreenUtil().setSp(regularFont()),
  //                           color: AppColors.backgroundColor,
  //                           fontWeight: FontWeight.bold
  //                         // fontFamily: "NexaBold"
  //                       ),
  //                     ),
  //
  //                     ///Email
  //                     (controller.userMail.isNotEmpty)
  //                         ? Expanded(
  //                       flex: 1,
  //                       child: Text(
  //                         controller.userMail.toString(),
  //                         style: TextStyle(
  //                             fontSize:
  //                             CustomScreenUtil().setSp(regularFont()),
  //                             color: AppColors.backgroundColor,
  //                             fontWeight: FontWeight.bold
  //                           // fontFamily: "NexaBold"
  //                         ),
  //                       ),
  //                     )
  //                         : Text(
  //                       AppStrings.email,
  //                       style: TextStyle(
  //                           fontSize:
  //                           CustomScreenUtil().setSp(regularFont()),
  //                           color: AppColors.backgroundColor,
  //                           fontWeight: FontWeight.bold
  //                         // fontFamily: "NexaBold"
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             ListTile(
  //               onTap: () {
  //                 controller.appBarTitle = "CheckIn";
  //                 controller.key.currentState?.closeDrawer();
  //                 controller.update();
  //               },
  //               leading: const Icon(Icons.checklist_rtl),
  //               title: const Text('CheckIn'),
  //             ),
  //             ListTile(
  //               onTap: () {
  //                 controller.appBarTitle = "Profile";
  //                 controller.key.currentState?.closeDrawer();
  //                 controller.update();
  //               },
  //               leading: const Icon(Icons.account_circle_rounded),
  //               title: const Text('Profile'),
  //             ),
  //             ListTile(
  //               onTap: () {
  //                 controller.appBarTitle = "Users";
  //                 controller.key.currentState?.closeDrawer();
  //                 controller.update();
  //               },
  //               leading: const Icon(Icons.people),
  //               title: const Text('Users'),
  //             ),
  //             ListTile(
  //               onTap: () {
  //                 controller.appBarTitle = "AttendanceHistory";
  //                 controller.key.currentState?.closeDrawer();
  //                 controller.update();
  //               },
  //               leading: const Icon(Icons.history),
  //               title: const Text('Attendance History'),
  //             ),
  //             ListTile(
  //               onTap: () {
  //                 controller.appBarTitle = "Settings";
  //                 controller.key.currentState?.closeDrawer();
  //                 controller.update();
  //               },
  //               leading: const Icon(Icons.settings),
  //               title: const Text('Settings'),
  //             ),
  //             SizedBox(
  //               height: CustomScreenUtil().setHeight(20),
  //             ),
  //             const Divider(
  //               color: Colors.black,
  //               height: 1,
  //               thickness: 1.0,
  //               indent: 20.0,
  //               endIndent: 10.0,
  //             ),
  //             SizedBox(
  //               height: CustomScreenUtil().setHeight(10),
  //             ),
  //             ListTile(
  //               onTap: () {
  //                 showConfirmDialog(controller.confirmLogout);
  //               },
  //               leading: const Icon(Icons.logout),
  //               title: const Text(AppStrings.logout),
  //             ),
  //           ]));
  // }

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
          controller.appBarTitle = "AttendanceHistory".obs;
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
