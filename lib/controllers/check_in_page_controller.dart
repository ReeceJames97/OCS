import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kf_ocs/models/users_model.dart';
import 'package:kf_ocs/utils/constants.dart';
import 'package:kf_ocs/utils/log_utils.dart';
import 'package:kf_ocs/utils/share_preference_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckInPageController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  double screenHeight = 0;
  double screenWidth = 0;
  final user = FirebaseAuth.instance.currentUser;
  String userMail = "";
  String userName = "";
  String location = "";
  RxString email = "".obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  late SharedPreferences? prefs;
  RxString todayDate = "".obs;
  RxString checkIn = "--/--".obs;
  RxString checkOut = "--/--".obs;

  void initialization() async{
    screenHeight = MediaQuery.of(Get.context!).size.height;
    screenWidth = MediaQuery.of(Get.context!).size.width;
    prefs = await SharedPreferences.getInstance();

    email = SharePreferenceUtils().getString(prefs?.getString(Constants.userEmail)).obs;
    todayDate.value = DateFormat("dd/MMM/yyyy").format(DateTime.now()).toString();
    // today = DateTime.now().day.toString().obs;
    if (user != null) {
      // User is authenticated, you can access their email
      userMail = user!.email ?? "";
      userName = user!.displayName ?? userMail;
    }

    getRecords();
  }

  void getLoc() async {
    List<Placemark> placemark = await placemarkFromCoordinates(UsersModel.lat, UsersModel.long);
    location = "${placemark[0].street}, ${placemark[0].administrativeArea}, ${placemark[0].postalCode}, ${placemark[0].country}";
    update();
    logD("Current Location : $location");
  }

  void getRecords() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      // Fetch the user's document from the "Employee" collection using the UID
      DocumentSnapshot snap = await FirebaseFirestore.instance
          .collection("Employee")
          .doc(uid)
          .collection("Records")
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .get();

      checkIn.value = snap['checkIn'];
      checkOut.value = snap['checkOut'];
      update();
    }catch (e){
      checkIn.value = "--/--";
      checkOut.value = "--/--";
      update();
    }

    logD("CheckIn Time : ${checkIn.value}");
    logD("CheckOut Time : ${checkOut.value}");

  }

  void onSubmitSlideBar() async{
    if(UsersModel.lat != 0){
      getLoc();
      // Get the user's UID
      String uid = FirebaseAuth.instance.currentUser!.uid;

      // Fetch the user's document from the "Employee" collection using the UID
      DocumentSnapshot snap = await FirebaseFirestore.instance
          .collection("Employee")
          .doc(uid)
          .collection("Records")
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .get();

      try{
        // Update the user's document with the check-in and check-out times
        String checkIn = snap['checkIn'];
        await FirebaseFirestore.instance
            .collection("Employee")
            .doc(uid)
            .collection("Records")
            .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
            .update({
          'date' : Timestamp.now(),
          'checkIn': checkIn,
          'checkOut': DateFormat('hh:mm a').format(DateTime.now()),
          'checkInLocation' : location,
        });

        checkOut.value = DateFormat('hh:mm a').format(DateTime.now());
        logD("Check-in and check-out times added successfully");
        update();

      } catch (e){
        await FirebaseFirestore.instance
            .collection("Employee").doc(uid)
            .collection("Records")
            .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
            .set({
          'date' : Timestamp.now(),
          'checkIn': DateFormat('hh:mm a').format(DateTime.now()),
          'checkOut' : "--/--",
          'checkOutLocation' : location,
        });

        checkIn.value = DateFormat('hh:mm a').format(DateTime.now());
        logD("No employee found with UID: $uid");
        update();
      }
    }else {
      Timer(const Duration(seconds: 2), () async {
        getLoc();
        // Get the user's UID
        String uid = FirebaseAuth.instance.currentUser!.uid;

        // Fetch the user's document from the "Employee" collection using the UID
        DocumentSnapshot snap = await FirebaseFirestore.instance
            .collection("Employee")
            .doc(uid)
            .collection("Records")
            .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
            .get();

        try{
          // Update the user's document with the check-in and check-out times
          String checkIn = snap['checkIn'];
          await FirebaseFirestore.instance
              .collection("Employee")
              .doc(uid)
              .collection("Records")
              .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
              .update({
            'date' : Timestamp.now(),
            'checkIn': checkIn,
            'checkOut': DateFormat('hh:mm a').format(DateTime.now()),
            'checkInLocation' : location,
          });

          checkOut.value = DateFormat('hh:mm a').format(DateTime.now());
          logD("Check-in and check-out times added successfully");
          update();

        } catch (e){
          await FirebaseFirestore.instance
              .collection("Employee").doc(uid)
              .collection("Records")
              .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
              .set({
            'date' : Timestamp.now(),
            'checkIn': DateFormat('hh:mm a').format(DateTime.now()),
            'checkOut' : "--/--",
            'checkOutLocation' : location,
          });

          checkIn.value = DateFormat('hh:mm a').format(DateTime.now());
          logD("No employee found with UID: $uid");
          update();
        }
      });
    }

  }

}
