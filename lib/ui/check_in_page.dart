import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/controllers/check_in_page_controller.dart';
import 'package:kf_ocs/controllers/home_screen_controller.dart';
import 'package:kf_ocs/controllers/main_navigator_controller.dart';
import 'package:kf_ocs/ui/nav_bar.dart';
import 'package:kf_ocs/utils/app_colors.dart';
import 'package:kf_ocs/utils/custom_screenutil.dart';
import 'package:kf_ocs/utils/toast.dart';
import 'package:lottie/lottie.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckInPageController>(
          init: CheckInPageController(),
          builder: (controller) => Scaffold(
                key: controller.scaffoldKey,
                resizeToAvoidBottomInset: true,
                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        width: controller.screenWidth,
                        child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Lottie.asset('assets/images/hello.json',
                                  width: CustomScreenUtil().setWidth(310),
                                  height: CustomScreenUtil().setWidth(320),
                                  animate: true,
                                  repeat: true,
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
    );
  }
}
