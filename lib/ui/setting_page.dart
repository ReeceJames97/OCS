import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/controllers/setting_page_controller.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingPageController>(
      init: SettingPageController(),
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
              child: Text("Setting"),
            ),
          )
        ));
  }
}
