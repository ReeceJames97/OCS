import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/controllers/home_screen_controller.dart';
import 'package:kf_ocs/utils/app_colors.dart';
import 'package:kf_ocs/utils/app_strings.dart';
import 'package:kf_ocs/utils/custom_screenutil.dart';
import 'package:kf_ocs/utils/dialog.dart';
import 'package:kf_ocs/utils/fontutils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),

        builder: (_) => AdvancedDrawer(
          disabledGestures: false,
            controller: controller.advancedDrawer,
            backdropColor: AppColors.standardBtnColor,
            animationCurve: Curves.bounceInOut,
            openRatio: 0.55,
            animationDuration: const Duration(milliseconds: 400),
            drawer: SafeArea(
              child: ListTileTheme(
                textColor: Colors.white,
                iconColor: Colors.white,
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 30),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        alignment: Alignment.center,
                        height: 170,
                        child: Column(children: [
                          Expanded(
                            flex: 2,
                            child: CircleAvatar(
                              maxRadius: 40,
                              backgroundColor: AppColors.standardBtnColor,
                              child: SvgPicture.asset(
                                'assets/images/profile.svg',
                                width: 80,
                                height: 80,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: CustomScreenUtil().setHeight(10),
                          ),

                          Expanded(
                            flex: 1,
                            child: Text(
                              AppStrings.hello,
                              style: TextStyle(
                                  fontSize:
                                      CustomScreenUtil().setSp(regularFont()),
                                  color: AppColors.backgroundColor,
                                  fontWeight: FontWeight.bold
                                  // fontFamily: "NexaBold"
                                  ),
                            ),
                          ),

                          ///Edit btn
                          Expanded(
                            flex: 1,
                            child: TextButton.icon(
                              onPressed: () {
                                // showConfirmDialog(confirmCallBack);
                              },
                              icon: const Icon(
                                Icons.edit,
                                size: 22.0,
                                color: AppColors.backgroundColor,
                              ),
                              label: Text(
                                AppStrings.edit,
                                style: TextStyle(
                                    color: AppColors.backgroundColor,
                                    fontSize: CustomScreenUtil().setSp(26)),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: CustomScreenUtil().setHeight(20),
                          ),
                        ])),
                    const Divider(
                      color: Colors.black,
                      height: 1,
                      thickness: 1.0,
                      indent: 20.0,
                      endIndent: 10.0,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.home),
                      title: const Text('Home'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.account_circle_rounded),
                      title: const Text('Profile'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.favorite),
                      title: const Text('Favourites'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                    ),
                    const Spacer(),
                    const Divider(
                      color: Colors.black,
                      height: 1,
                      thickness: 1.0,
                      indent: 20.0,
                      endIndent: 10.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: TextButton.icon(
                        // <-- TextButton
                        onPressed: () {
                          showConfirmDialog(controller.confirmCallBack);
                        },
                        icon: const Icon(
                          Icons.logout,
                          size: 22.0,
                          color: AppColors.backgroundColor,
                        ),
                        label: Text(
                          AppStrings.logout,
                          style: TextStyle(
                              color: AppColors.backgroundColor,
                              fontSize: CustomScreenUtil().setSp(26)),
                        ),
                      ),
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white54,
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: const Text('Terms of Service | Privacy Policy'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.appBarColor,
                title: const Text(AppStrings.home),
                leading: IconButton(
                  icon: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: controller.advancedDrawer,
                    builder: (_, value, __) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: Icon(
                          value.visible ? Icons.clear : Icons.menu,
                          key: ValueKey<bool>(value.visible),
                        ),
                      );
                    },
                  ),
                  onPressed: () {
                    controller.drawerControl();
                  },
                  // icon: const Icon(Icons.menu),
                ),
              ),
            )));
  }
}
