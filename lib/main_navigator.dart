import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/controllers/main_navigator_controller.dart';
import 'package:kf_ocs/ui/nav_bar.dart';
import 'package:kf_ocs/ui/today_screen.dart';
import 'package:kf_ocs/utils/app_colors.dart';
import 'package:kf_ocs/utils/app_strings.dart';
import 'package:kf_ocs/utils/custom_screenutil.dart';
import 'package:kf_ocs/utils/dialog.dart';
import 'package:kf_ocs/utils/fontutils.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  final MainNavigatorController controller = Get.put(MainNavigatorController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavigatorController>(
        init: MainNavigatorController(),
        builder: (_) => Scaffold(
              key: controller.key,
              appBar: AppBar(
                title: const Text("Main"),
                centerTitle: true,
                titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                backgroundColor: AppColors.appBarColor,
                iconTheme: const IconThemeData(color: Colors.white),
                // leading: IconButton(
                //   icon: ValueListenableBuilder<AdvancedDrawerValue>(
                //     valueListenable: controller.advancedDrawer,
                //     builder: (_, value, __) {
                //       return AnimatedSwitcher(
                //         duration: const Duration(milliseconds: 250),
                //         child: Icon(
                //           value.visible ? Icons.clear : Icons.menu,
                //           key: ValueKey<bool>(value.visible),
                //         ),
                //       );
                //     },
                //   ),
                //   onPressed: () {
                //     drawerController.showDrawer();
                //   },
                //   // icon: const Icon(Icons.menu),
                // ),
              ),
              drawer: NavBar(),
              body: Text("Main"),
              resizeToAvoidBottomInset: true,

              // drawer: AdvancedDrawer(
              //     disabledGestures: false,
              //     controller: controller.advancedDrawer,
              //     backdropColor: AppColors.standardBtnColor,
              //     animationCurve: Curves.bounceInOut,
              //     openRatio: 0.77,
              //     animationDuration: const Duration(milliseconds: 400),
              //     drawer: SafeArea(
              //       child: ListTileTheme(
              //         textColor: Colors.white,
              //         iconColor: Colors.white,
              //         child: Column(
              //           children: [
              //             Container(
              //                 // margin: const EdgeInsets.only(top: 10),
              //                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              //                 alignment: Alignment.center,
              //                 height: 170,
              //                 child: Column(children: [
              //                   ///Photo
              //                   Expanded(
              //                     flex: 4,
              //                     child: (controller.photoUrl.isNotEmpty)
              //                         ? CircleAvatar(
              //                             backgroundColor:
              //                                 AppColors.appBarColor,
              //                             radius: 37,
              //                             child: CircleAvatar(
              //                                 maxRadius: 35,
              //                                 backgroundImage: NetworkImage(
              //                                     controller.photoUrl)),
              //                           )
              //                         : CircleAvatar(
              //                             backgroundColor:
              //                                 AppColors.appBarColor,
              //                             radius: 37,
              //                             child: CircleAvatar(
              //                               maxRadius: 35,
              //                               backgroundColor:
              //                                   AppColors.standardBtnColor,
              //                               child: SvgPicture.asset(
              //                                 'assets/images/profile.svg',
              //                                 width: 80,
              //                                 height: 80,
              //                               ),
              //                             ),
              //                           ),
              //                   ),
              //
              //                   ///Email
              //                   (controller.userMail.isNotEmpty)
              //                       ? Expanded(
              //                           flex: 1,
              //                           child: Text(
              //                             controller.userMail.toString(),
              //                             style: TextStyle(
              //                                 fontSize: CustomScreenUtil()
              //                                     .setSp(regularFont()),
              //                                 color: AppColors.backgroundColor,
              //                                 fontWeight: FontWeight.bold
              //                                 // fontFamily: "NexaBold"
              //                                 ),
              //                           ),
              //                         )
              //                       : Text(
              //                           AppStrings.email,
              //                           style: TextStyle(
              //                               fontSize: CustomScreenUtil()
              //                                   .setSp(regularFont()),
              //                               color: AppColors.backgroundColor,
              //                               fontWeight: FontWeight.bold
              //                               // fontFamily: "NexaBold"
              //                               ),
              //                         ),
              //                   SizedBox(
              //                     height: CustomScreenUtil().setHeight(10),
              //                   ),
              //                 ])),
              //             const Divider(
              //               color: Colors.black,
              //               height: 1,
              //               thickness: 1.0,
              //               indent: 20.0,
              //               endIndent: 10.0,
              //             ),
              //             ListTile(
              //               onTap: () {
              //                 Get.to(() => const TodayScreen());
              //               },
              //               leading: const Icon(Icons.home),
              //               title: const Text('Home'),
              //             ),
              //             ListTile(
              //               onTap: () {},
              //               leading: const Icon(Icons.account_circle_rounded),
              //               title: const Text('Profile'),
              //             ),
              //             ListTile(
              //               onTap: () {},
              //               leading: const Icon(Icons.favorite),
              //               title: const Text('Favourites'),
              //             ),
              //             ListTile(
              //               onTap: () {},
              //               leading: const Icon(Icons.settings),
              //               title: const Text('Settings'),
              //             ),
              //             const Spacer(),
              //             const Divider(
              //               color: Colors.black,
              //               height: 1,
              //               thickness: 1.0,
              //               indent: 20.0,
              //               endIndent: 10.0,
              //             ),
              //             Container(
              //               margin: const EdgeInsets.only(top: 10),
              //               child: TextButton.icon(
              //                 // <-- TextButton
              //                 onPressed: () {
              //                   // showConfirmDialog(AuthController.instance.confirmLogout() as Function);
              //                   showConfirmDialog(controller.confirmLogout);
              //                 },
              //                 icon: const Icon(
              //                   Icons.logout,
              //                   size: 22.0,
              //                   color: AppColors.backgroundColor,
              //                 ),
              //                 label: Text(
              //                   AppStrings.logout,
              //                   style: TextStyle(
              //                       color: AppColors.backgroundColor,
              //                       fontSize: CustomScreenUtil().setSp(26)),
              //                 ),
              //               ),
              //             ),
              //             DefaultTextStyle(
              //               style: const TextStyle(
              //                 fontSize: 12,
              //                 color: Colors.white54,
              //               ),
              //               child: Container(
              //                 margin: const EdgeInsets.symmetric(
              //                   vertical: 16.0,
              //                 ),
              //                 child: const Text(
              //                     'Terms of Service | Privacy Policy'),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     child: const Center(child: Text("main"))),
            ));
  }
}
