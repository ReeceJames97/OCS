import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kf_ocs/controllers/check_in_page_controller.dart';
import 'package:kf_ocs/utils/app_strings.dart';
import 'package:kf_ocs/utils/custom_screenutil.dart';
import 'package:kf_ocs/utils/fontutils.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_act/slide_to_act.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                  ),
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  elevation: 10,
                  child: Column(
                      children: [
                    SizedBox(
                      width: controller.screenWidth,
                      child: Center(
                        child: Container(
                          child: Lottie.asset('assets/images/hello.json',
                              width: CustomScreenUtil().setWidth(310),
                              height: CustomScreenUtil().setWidth(320),
                              animate: true,
                              repeat: true,
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.welcome,
                          style: TextStyle(
                              fontSize:
                              CustomScreenUtil().setWidth(biggerFont()),
                              // fontWeight: FontWeight.bold,
                              color: Colors.black
                            // fontFamily: "NexaBold"
                          ),
                        ),
                        SizedBox(
                          width: CustomScreenUtil().setWidth(10),
                        ),
                        Text(
                            controller.userName,
                            style: TextStyle(
                                fontSize:
                                CustomScreenUtil().setWidth(biggestFont()),
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              // fontFamily: "NexaBold"
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: CustomScreenUtil().setHeight(20)),
                  ])),
              SizedBox(height: CustomScreenUtil().setHeight(10)),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  "Today's Status",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: CustomScreenUtil().setWidth(biggestFont()),
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: CustomScreenUtil().setHeight(5)),
              Container(
                margin: const EdgeInsets.all(12),
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Check In",
                              style: TextStyle(
                                  fontSize: controller.screenWidth / 20,
                                  fontFamily: "NexaBold",
                                  color: Colors.black54
                              ),
                            ),

                            SizedBox(height: CustomScreenUtil().setHeight(5)),

                            Obx(
                              () => Text(
                                controller.checkIn.value,
                                style: TextStyle(
                                  fontSize: controller.screenWidth / 18,
                                  fontFamily: "NexaBold",
                                  // fontFamily: "NexaBold"
                                ),
                              ),
                            ),
                          ],
                        )),

                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Check Out",
                              style: TextStyle(
                                  fontSize: controller.screenWidth / 20,
                                  fontFamily: "NexaBold",
                                  color: Colors.black54
                              ),
                            ),

                            SizedBox(height: CustomScreenUtil().setHeight(5)),

                            Obx(
                              () => Text(
                                controller.checkOut.value,
                                style: TextStyle(
                                  fontSize: controller.screenWidth / 18,
                                  fontFamily: "NexaBold",
                                  // fontFamily: "NexaBold"
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20,top: 20),
                child: Obx(
                      () => Text(
                    controller.todayDate.value,
                    style: TextStyle(
                        fontSize: controller.screenWidth / 18,
                        fontFamily: "NexaBold",
                        color: Colors.redAccent
                    ),
                  ),
                ),
              ),

              StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  final currentTime = DateFormat("hh:mm:ss a").format(DateTime.now()).toString();
                  return Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                                currentTime,
                        style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: controller.screenWidth / 20,
                            color: Colors.black54
                        ),
                      ),
                    // ),
                  );
                },
              ),
              
              controller.checkOut.value == "--/--" ? Container(
                    margin: const EdgeInsets.all(20),
                    child: Builder(builder: (context){
                      final GlobalKey<SlideActionState> key = GlobalKey();
                      return SlideAction(
                        text: controller.checkIn.value == "--/--" ? "Slide to Check In" : "Slide to Check Out",
                        textStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: controller.screenWidth / 20,
                          fontFamily: "NexaRegular"
                        ),
                        outerColor: Colors.white,
                        innerColor: Colors.red,
                        key: key,
                        onSubmit: () async{
                          Future.delayed(const Duration(milliseconds: 500), (){
                            key.currentState!.reset();
                          });
                          controller.onSubmitSlideBar();
                        },
                      );
                    }),
              ) : Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(20),
                      child: Text(
                        "You have completed today!",
                        style: TextStyle(
                            fontSize: controller.screenWidth / 20,
                            fontFamily: "NexaBold",
                            color: Colors.black54
                        ),
                      )),


              controller.location != "" ? Text(
                "Location : ${controller.location}",
              ): const SizedBox(
                child: Text(
                  "Location not found!"
                ),
              )
      ]
    ))));
  }

}
