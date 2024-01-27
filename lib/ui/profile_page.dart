import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/controllers/main_navigator_controller.dart';
import 'package:kf_ocs/controllers/profile_page_controller.dart';
import 'package:kf_ocs/controllers/setting_page_controller.dart';
import 'package:kf_ocs/ui/nav_bar.dart';
import 'package:kf_ocs/utils/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  // final MainNavigatorController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePageController>(
      init: ProfilePageController(),
        builder: (controller) => Scaffold(
            // appBar: AppBar(
            //   title: const Text("Setting"),
            //   centerTitle: true,
            //   titleTextStyle: const TextStyle(
            //       color: Colors.white,
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold),
            //   backgroundColor: AppColors.appBarColor,
            //   iconTheme: const IconThemeData(color: Colors.white),
            //   // leading: IconButton(
            //   //   onPressed: () {
            //   //     navController.key.currentState?.openDrawer();
            //   //   },
            //   //   icon: const Icon(Icons.menu),
            //   // ),
            // ),
            key: controller.scaffoldKey,
            resizeToAvoidBottomInset: true,
            // drawer: const NavBar(),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: const Center(
              child: Text("Profile"),
            ),
          )
        ));
  }
}
