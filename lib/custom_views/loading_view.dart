import 'package:flutter/material.dart';
import 'package:kf_ocs/utils/app_strings.dart';
import 'package:kf_ocs/utils/custom_screenutil.dart';
import 'package:lottie/lottie.dart';

Widget loadingView({String? loadingText = AppStrings.loading}){
  return Container(alignment: Alignment.center,child: Center(
    child: SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //CircularProgressIndicator(),
            Container(
              padding: const EdgeInsets.all(10),
              width: CustomScreenUtil().setWidth(80),
              height: CustomScreenUtil().setHeight(60),
              child: Lottie.asset('assets/images/loadingspinner.json',
                  width: CustomScreenUtil().setWidth(80),
                  height: CustomScreenUtil().setHeight(60),
                  animate: true,
                  repeat: true,
                  fit: BoxFit.fill),
            ),
            SizedBox(
              height: CustomScreenUtil().setHeight(30),
            ),
            Text(loadingText??AppStrings.loading)
          ],
        ),
      ),
    ),
  ),);
}