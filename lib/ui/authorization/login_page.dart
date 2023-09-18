import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/controllers/authorization/login_page_controller.dart';
import 'package:kf_ocs/controllers/keyboard_controller.dart';
import 'package:kf_ocs/custom_views/custom_standard_button.dart';
import 'package:kf_ocs/custom_views/keyboard_dimiss_view.dart';
import 'package:kf_ocs/utils/colors.dart';
import 'package:kf_ocs/utils/custom_screenutil.dart';
import 'package:kf_ocs/utils/fontutils.dart';
import 'package:kf_ocs/utils/strings.dart';
import 'package:kf_ocs/utils/toast.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPageController controller = Get.put(LoginPageController());

  final KeyboardController keyboardController = Get.find<KeyboardController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginPageController>(
        init: LoginPageController(),
        builder: (_) => keyboardDismissView(
              child: Scaffold(
                  key: controller.scaffoldKey,
                  // appBar: getAppbar(STRINGS.login),
                  resizeToAvoidBottomInset: true,
                  body: buildBodyWidget()),
            ));
  }

  Widget buildBodyWidget() {
    return Container(
      color: AppColors.backgroundColor,
      child: Column(
        children: [
          Obx(() => keyboardController.isKeyboardVisible.isTrue
              ? SizedBox(
                  height: controller.screenHeight / 16,
                )
              : Container(
                  height: controller.screenHeight / 2.8,
                  width: controller.screenWidth,
                  decoration: const BoxDecoration(
                    color: AppColors.standardBtnColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(80),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                              padding:
                              const EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Lottie.asset(
                                  'assets/images/login.json',
                                  width: CustomScreenUtil().setWidth(310),
                                  height: CustomScreenUtil().setWidth(320),
                                  animate: true,
                                  repeat: true,
                                  fit: BoxFit.fill),
                            ),


                        Text(
                              AppStrings.welcomeBackPlsLogin,
                              style: TextStyle(
                                  fontSize: CustomScreenUtil().setSp(35),
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: "NexaBold"),
                            ),

                        ],
                      ),
                    ),
                  ),
                )),
          Container(
            padding: EdgeInsets.all(CustomScreenUtil().setWidth(20)),
            margin: EdgeInsets.all(CustomScreenUtil().setWidth(20)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///Login Text
                  Text(
                    AppStrings.login,
                    style: TextStyle(
                        fontSize: CustomScreenUtil().setSp(50),
                        fontFamily: "NexaBold"),
                  ),

                  SizedBox(
                    height: CustomScreenUtil().setHeight(30),
                  ),

                  /// UserID Input
                  PhysicalModel(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                    elevation: 5,
                    child: TextField(
                        controller: controller.userIdController,
                        decoration: InputDecoration(
                            isDense: true,
                            labelText: AppStrings.userName,
                            labelStyle: TextStyle(
                                color: AppColors.standardBtnColor,
                                fontSize: CustomScreenUtil().setSp(bigFont())),
                            fillColor: Colors.white70,
                            contentPadding:
                                EdgeInsets.all(CustomScreenUtil().setWidth(25)),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  color: AppColors.standardBtnColor),
                            ),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            prefixIcon: const Icon(Icons.person,
                                color: AppColors.standardBtnColor)),
                        style:
                            TextStyle(fontSize: CustomScreenUtil().setSp(32))),
                  ),

                  SizedBox(
                    height: CustomScreenUtil().setHeight(40),
                  ),

                  /// Password input
                  Obx(() => PhysicalModel(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        elevation: 5,
                        child: TextField(
                            controller: controller.passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: !(controller.isPasswordVisible.value),
                            decoration: InputDecoration(
                                isDense: true,
                                labelText: AppStrings.password,
                                labelStyle: TextStyle(
                                    color: AppColors.standardBtnColor,
                                    fontSize:
                                        CustomScreenUtil().setSp(bigFont())),
                                fillColor: Colors.white70,
                                contentPadding: EdgeInsets.all(
                                    CustomScreenUtil().setWidth(25)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25)),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                  borderSide: BorderSide(
                                      color: AppColors.standardBtnColor),
                                ),
                                filled: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                prefixIcon: Icon(MdiIcons.key,
                                    color: AppColors.standardBtnColor),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      controller.isPasswordVisible.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: AppColors.standardBtnColor),
                                  onPressed: () {
                                    controller.updatePasswordVisible();
                                  },
                                )),
                            style: TextStyle(
                                fontSize: CustomScreenUtil().setSp(32))),
                      )),

                  SizedBox(
                    height: CustomScreenUtil().setHeight(30),
                  ),

                  /// Forget Password text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          showToast(AppStrings.forgotPassword);
                        },
                        child: Text(
                          AppStrings.forgotPassword,
                          style: TextStyle(
                              fontSize:
                                  CustomScreenUtil().setWidth(regularFont()),
                              fontWeight: FontWeight.bold
                              // fontFamily: "NexaBold"
                              ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: CustomScreenUtil().setHeight(0),
                  ),

                  ///Remember me checkbox
                  Obx(() => ListTileTheme(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0.0,
                      child: CheckboxListTile(
                        activeColor: AppColors.standardBtnColor,
                        visualDensity: const VisualDensity(
                            horizontal: -1.0, vertical: -4.0),
                        title: Text(
                          AppStrings.rememberMe,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(28),
                              color: AppColors.standardBtnColor,
                              fontWeight: FontWeight.bold),
                        ),
                        value: controller.isRememberMe.value,
                        onChanged: (newValue) {
                          controller.updateRememberMe(newValue ?? false);
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      ))),

                  SizedBox(
                    height: CustomScreenUtil().setHeight(30),
                  ),

                  ///Login btn
                  customStandardBtn(AppStrings.login,
                      callBack: controller.onTapLoginBtn),

                  SizedBox(
                    height: CustomScreenUtil().setHeight(20),
                  ),

                  /// Don't have an account text
                  RichText(
                      text: TextSpan(
                          text: AppStrings.doNotHaveAnAccount,
                          style: TextStyle(
                              fontSize:
                                  CustomScreenUtil().setWidth(regularFont()),
                              color: Colors.grey[800],
                              fontWeight: FontWeight.normal
                              // fontFamily: "NexaBold"
                              ),
                          children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              controller.onTapCreateText();
                            },
                          text: "  ${AppStrings.create}",
                          style: TextStyle(
                              fontSize:
                                  CustomScreenUtil().setWidth(bigFont()),
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                              // fontFamily: "NexaBold"
                              ),
                        )
                      ]))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
