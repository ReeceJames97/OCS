import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/controllers/main_navigator_controller.dart';
import 'package:kf_ocs/ui/home_screen.dart';
import 'package:kf_ocs/ui/setting_page.dart';
import 'package:kf_ocs/utils/app_colors.dart';
import 'package:kf_ocs/utils/app_strings.dart';
import 'package:kf_ocs/utils/custom_screenutil.dart';
import 'package:kf_ocs/utils/dialog.dart';
import 'package:kf_ocs/utils/fontutils.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final MainNavigatorController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 5,
        child: ListView(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: AppColors.appBarColor,
                ),
                child: Center(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: (controller.photoUrl.isNotEmpty)
                            ? CircleAvatar(
                            backgroundColor: AppColors.appBarColor,
                            radius: 37,
                            child: CircleAvatar(
                                maxRadius: 35,
                                backgroundImage:
                                NetworkImage(controller.photoUrl)))
                            : CircleAvatar(
                          backgroundColor: AppColors.appBarColor,
                          radius: 37,
                          child: CircleAvatar(
                            maxRadius: 35,
                            backgroundColor: AppColors.standardBtnColor,
                            child: SvgPicture.asset(
                              'assets/images/profile.svg',
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                      ),

                      ///Name
                      (controller.userName.isNotEmpty)
                          ? Expanded(
                        flex: 1,
                        child: Text(
                          controller.userName.toString(),
                          style: TextStyle(
                              fontSize:
                              CustomScreenUtil().setSp(regularFont()),
                              color: AppColors.backgroundColor,
                              fontWeight: FontWeight.bold
                            // fontFamily: "NexaBold"
                          ),
                        ),
                      )
                          : Text(
                        AppStrings.name,
                        style: TextStyle(
                            fontSize:
                            CustomScreenUtil().setSp(regularFont()),
                            color: AppColors.backgroundColor,
                            fontWeight: FontWeight.bold
                          // fontFamily: "NexaBold"
                        ),
                      ),

                      ///Email
                      (controller.userMail.isNotEmpty)
                          ? Expanded(
                        flex: 1,
                        child: Text(
                          controller.userMail.toString(),
                          style: TextStyle(
                              fontSize:
                              CustomScreenUtil().setSp(regularFont()),
                              color: AppColors.backgroundColor,
                              fontWeight: FontWeight.bold
                            // fontFamily: "NexaBold"
                          ),
                        ),
                      )
                          : Text(
                        AppStrings.email,
                        style: TextStyle(
                            fontSize:
                            CustomScreenUtil().setSp(regularFont()),
                            color: AppColors.backgroundColor,
                            fontWeight: FontWeight.bold
                          // fontFamily: "NexaBold"
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  controller.appBarTitle = "CheckIn".obs;
                  controller.key.currentState?.closeDrawer();
                  controller.update();
                },
                leading: const Icon(Icons.checklist_rtl),
                title: const Text('CheckIn'),
              ),
              ListTile(
                onTap: () {
                  controller.appBarTitle = "Profile".obs;
                  controller.key.currentState?.closeDrawer();
                  controller.update();
                },
                leading: const Icon(Icons.account_circle_rounded),
                title: const Text('Profile'),
              ),
              ListTile(
                onTap: () {
                  controller.appBarTitle = "Users".obs;
                  controller.key.currentState?.closeDrawer();
                  controller.update();
                },
                leading: const Icon(Icons.people),
                title: const Text('Users'),
              ),
              ListTile(
                onTap: () {
                  controller.appBarTitle = "AttendanceHistory".obs;
                  controller.key.currentState?.closeDrawer();
                  controller.update();
                },
                leading: const Icon(Icons.history),
                title: const Text('Attendance History'),
              ),
              ListTile(
                onTap: () {
                  controller.appBarTitle = "Settings".obs;
                  controller.key.currentState?.closeDrawer();
                  controller.update();
                },
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
              ),
              SizedBox(
                height: CustomScreenUtil().setHeight(20),
              ),
              const Divider(
                color: Colors.black,
                height: 1,
                thickness: 1.0,
                indent: 20.0,
                endIndent: 10.0,
              ),
              SizedBox(
                height: CustomScreenUtil().setHeight(10),
              ),
              ListTile(
                onTap: () {
                  showConfirmDialog(controller.confirmLogout);
                },
                leading: const Icon(Icons.logout),
                title: const Text(AppStrings.logout),
              ),
            ]));
  }
}
