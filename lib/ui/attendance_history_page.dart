import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kf_ocs/controllers/attendance_history_page_controller.dart';
import 'package:kf_ocs/custom_views/empty_view.dart';
import 'package:kf_ocs/models/users_model.dart';
import 'package:kf_ocs/utils/custom_screenutil.dart';
import 'package:kf_ocs/utils/fontutils.dart';
import 'package:kf_ocs/utils/log_utils.dart';
import 'package:month_year_picker/month_year_picker.dart';

class AttendanceHistoryPage extends StatefulWidget {
  const AttendanceHistoryPage({super.key});

  @override
  State<AttendanceHistoryPage> createState() => _AttendanceHistoryPageState();
}

class _AttendanceHistoryPageState extends State<AttendanceHistoryPage> {
  // final MainNavigatorController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceHistoryPageController>(
        init: AttendanceHistoryPageController(),
        builder: (controller) => Scaffold(
            key: controller.scaffoldKey,
            resizeToAvoidBottomInset: true,
            // drawer: const NavBar(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        controller.month,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize:
                                CustomScreenUtil().setWidth(biggestFont()),
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            final month = await showMonthYearPicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2024),
                                lastDate: DateTime(2099),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary: Colors.redAccent,
                                        secondary: Colors.redAccent,
                                        onSecondary: Colors.white,
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.redAccent,
                                        ),
                                      ),
                                      textTheme: const TextTheme(
                                          headlineMedium:
                                              TextStyle(fontFamily: 'NexaBold'),
                                          labelSmall:
                                              TextStyle(fontFamily: 'NexaBold'),
                                          labelLarge: TextStyle(
                                              fontFamily: 'NexaBold')),
                                    ),
                                    child: child!,
                                  );
                                });

                            if (month != null) {
                              controller.month =
                                  DateFormat("MMMM").format(month);
                              controller.update();
                            }
                          },
                          child: Text(
                            "Pick a month",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize:
                                    CustomScreenUtil().setWidth(biggestFont()),
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: CustomScreenUtil().setHeight(30)),

                  ///Attendance History List
                  SizedBox(
                      // margin: const EdgeInsets.all(5),
                      height:
                          controller.screenHeight - controller.screenHeight / 5,
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("Employee")
                              .doc(UsersModel.userId.toString())
                              .collection("Records")
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasData) {
                              final snap = snapshot.data!.docs;
                              return ListView.builder(
                                  itemCount: snap.length,
                                  itemBuilder: (context, index) {
                                    return DateFormat("MMMM").format(
                                                snap[index]['date'].toDate()) ==
                                            controller.month
                                        ? Container(
                                            margin: const EdgeInsets.all(5),
                                            height: 130,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  blurRadius: 10,
                                                  offset: Offset(2, 2),
                                                )
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.redAccent,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      DateFormat("EE\ndd")
                                                          .format(snap[index]
                                                                  ['date']
                                                              .toDate()),
                                                      style: TextStyle(
                                                          fontSize: controller
                                                                  .screenWidth /
                                                              18,
                                                          fontFamily:
                                                              "NexaBold",
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Check In",
                                                      style: TextStyle(
                                                          fontSize: controller
                                                                  .screenWidth /
                                                              22,
                                                          fontFamily:
                                                              "NexaBold",
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                    SizedBox(
                                                        height:
                                                            CustomScreenUtil()
                                                                .setHeight(5)),
                                                    Text(
                                                      snap[index]['checkIn']
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: controller
                                                                .screenWidth /
                                                            20,
                                                        fontFamily: "NexaBold",
                                                        // fontFamily: "NexaBold"
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                                Expanded(
                                                    child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Check Out",
                                                      style: TextStyle(
                                                          fontSize: controller
                                                                  .screenWidth /
                                                              22,
                                                          fontFamily:
                                                              "NexaBold",
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                    SizedBox(
                                                        height:
                                                            CustomScreenUtil()
                                                                .setHeight(5)),
                                                    Text(
                                                      snap[index]['checkOut']
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: controller
                                                                .screenWidth /
                                                            20,
                                                        fontFamily: "NexaBold",
                                                        // fontFamily: "NexaBold"
                                                      ),
                                                    ),
                                                  ],
                                                ))
                                              ],
                                            ),
                                          )
                                        : const SizedBox();
                                  });
                            } else {
                              logD("Empty View");
                              return Expanded(
                                  child: getEmptyView(
                                      title: "Empty Data!",
                                      message: "No data found!",
                                      isAnimate: true));
                              // return Container(
                              //   alignment: Alignment.center,
                              //   child: const Text("Empty Data!"),
                              // );
                            }
                          }))
                ],
              ),
            )));
  }
}
