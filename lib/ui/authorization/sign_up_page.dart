import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_ocs/controllers/authorization/sign_up_page_controller.dart';
import 'package:kf_ocs/controllers/keyboard_controller.dart';
import 'package:kf_ocs/custom_views/custom_standard_button.dart';
import 'package:kf_ocs/custom_views/keyboard_dimiss_view.dart';
import 'package:kf_ocs/utils/app_colors.dart';
import 'package:kf_ocs/utils/app_strings.dart';
import 'package:kf_ocs/utils/custom_screenutil.dart';
import 'package:kf_ocs/utils/fontutils.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpPageController controller = Get.put(SignUpPageController());

  final KeyboardController keyboardController = Get.find<KeyboardController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpPageController>(
        init: SignUpPageController(),
        builder: (_) => keyboardDismissView(
              child: Scaffold(
                key: controller.key,
                // appBar: getAppbar(STRINGS.sign_up),
                resizeToAvoidBottomInset: true,
                body: buildBodyWidget(),
              ),
            ));
  }

  Widget buildBodyWidget() {
    return SingleChildScrollView(
      child: Container(
        height: controller.screenHeight,
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
                        // bottomRight: Radius.circular(80),
                        bottomLeft: Radius.circular(80),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Lottie.asset('assets/images/login.json',
                                  width: CustomScreenUtil().setWidth(310),
                                  height: CustomScreenUtil().setWidth(320),
                                  animate: true,
                                  repeat: true,
                                  fit: BoxFit.fill),
                            ),
                            Text(
                              AppStrings.signUpAndGetStarted,
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
                    ///Sign Up Text
                    Text(
                      AppStrings.signUp,
                      style: TextStyle(
                          fontSize: CustomScreenUtil().setSp(50),
                          fontFamily: "NexaBold"),
                    ),

                    SizedBox(
                      height: CustomScreenUtil().setHeight(30),
                    ),

                    // /// UserID Input
                    // PhysicalModel(
                    //   color: Colors.transparent,
                    //   borderRadius: BorderRadius.circular(25),
                    //   elevation: 5,
                    //   child: TextField(
                    //       controller: controller.txtUserIdController,
                    //       decoration: InputDecoration(
                    //           isDense: true,
                    //           labelText: AppStrings.userName,
                    //           labelStyle: TextStyle(
                    //               color: AppColors.standardBtnColor,
                    //               fontSize: CustomScreenUtil().setSp(bigFont())),
                    //           fillColor: Colors.white70,
                    //           contentPadding:
                    //               EdgeInsets.all(CustomScreenUtil().setWidth(25)),
                    //           border: OutlineInputBorder(
                    //               borderSide:
                    //                   const BorderSide(color: Colors.black),
                    //               borderRadius: BorderRadius.circular(20)),
                    //           enabledBorder: const OutlineInputBorder(
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(20.0)),
                    //             borderSide: BorderSide(color: Colors.grey),
                    //           ),
                    //           focusedBorder: const OutlineInputBorder(
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(20.0)),
                    //             borderSide: BorderSide(
                    //                 color: AppColors.standardBtnColor),
                    //           ),
                    //           filled: true,
                    //           floatingLabelBehavior: FloatingLabelBehavior.auto,
                    //           prefixIcon: const Icon(Icons.person,
                    //               color: AppColors.standardBtnColor)),
                    //       style:
                    //           TextStyle(fontSize: CustomScreenUtil().setSp(32))),
                    // ),
                    //
                    // SizedBox(
                    //   height: CustomScreenUtil().setHeight(20),
                    // ),

                    /// Email Input
                    PhysicalModel(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      elevation: 5,
                      child: TextField(
                          controller: controller.txtEmailController,
                          decoration: InputDecoration(
                              isDense: true,
                              labelText: AppStrings.email,
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
                              prefixIcon: const Icon(Icons.email,
                                  color: AppColors.standardBtnColor)),
                          style: TextStyle(
                              fontSize: CustomScreenUtil().setSp(32))),
                    ),

                    SizedBox(
                      height: CustomScreenUtil().setHeight(20),
                    ),

                    /// Password input
                    Obx(() => PhysicalModel(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                          elevation: 5,
                          child: TextField(
                              controller: controller.txtPasswordController,
                              keyboardType: TextInputType.text,
                              obscureText:
                                  !(controller.isPasswordVisible.value),
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
                      height: CustomScreenUtil().setHeight(40),
                    ),

                    ///Sign Up btn
                    customStandardBtn(AppStrings.signUp,
                        callBack: controller.onTapSignUpBtn),

                    SizedBox(
                      height: CustomScreenUtil().setHeight(30),
                    ),

                    /// Already have an account text
                    RichText(
                        text: TextSpan(
                            text: AppStrings.alreadyHaveAnAccount,
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
                                controller.onTapLoginText();
                              },
                            text: AppStrings.login,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize:
                                    CustomScreenUtil().setWidth(biggerFont()),
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                                // fontFamily: "NexaBold"
                                ),
                          )
                        ])),

                    SizedBox(
                      height: CustomScreenUtil().setHeight(20),
                    ),

                    Text(
                      AppStrings.or,
                      style: TextStyle(
                        fontSize: CustomScreenUtil().setWidth(regularFont()),
                        fontWeight: FontWeight.bold,
                        // color: Colors.black
                        // fontFamily: "NexaBold"
                      ),
                    ),

                    SizedBox(
                      height: CustomScreenUtil().setHeight(10),
                    ),

                    Text(
                      AppStrings.signUpUsing,
                      style: TextStyle(
                          fontSize: CustomScreenUtil().setWidth(regularFont()),
                          fontWeight: FontWeight.normal
                          // fontFamily: "NexaBold"
                          ),
                    ),

                    SizedBox(
                      height: CustomScreenUtil().setHeight(25),
                    ),

                    GestureDetector(
                      onTap: () {
                        controller.loginWithGoogle();
                      },
                      child: const CircleAvatar(
                        maxRadius: 24,
                        backgroundColor: AppColors.backgroundColor,
                        backgroundImage: AssetImage('assets/images/google.png'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
